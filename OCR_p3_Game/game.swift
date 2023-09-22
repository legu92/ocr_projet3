//
//  game.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//
//  This class represent the main class for the game. It manages the initialisation of the game, the party
//  and the final statistics display

import Foundation


class Game
{
    private var m_iNumberOfLoops: Int = 0 //count the number of loops for statistics at the end
    
    private var m_aoPlayers : [Player] = []
    
    //Factory to create the Character by the player choice
    private var m_oMyCharactersFactory = CharacterFactory()
    
    //called automatically by creating the instance of the Game
    //Create the players objets for the 2 players choosen with its name
    //display a resume of the player
    init()
    {
        print("")
        print("")
        print("===========================================")
        print("====== Initialisation de la partie ========")
        print("===========================================")
        
        for i in 0 ..< 2
        {
            let szName = Game.askForAString(question: "Nom du joueur \(i+1) : ")
            m_aoPlayers.append(Player(name: szName, characterFactory: m_oMyCharactersFactory))
            print("")
            print(m_aoPlayers[i].displayTeam())
            print("")
        }
    }
    
    //The method is a loop that alternitavely give the hand to each player to play
    //The loop ends when the game is over (just 1 player left)
    //for each pass, it delegate to the objet Player the play
    func play()
    {

        print("")
        print("")
        print("===========================================")
        print("======      La partie commence     ========")
        print("===========================================")
        print("")
        repeat
        {
            m_iNumberOfLoops += 1
            print("")
            print("----  \(m_iNumberOfLoops)", terminator: "")
            print( (m_iNumberOfLoops == 1 ? "er" : "eme") + " tour  -----")
            m_aoPlayers[m_iNumberOfLoops%2].playTrickAginst(opponent: m_aoPlayers[(m_iNumberOfLoops+1)%2])

            print("")
        }
        while(!gameIsOver())
        
        
    }
    
    //Display all the statistics of the game
    func showStatistics() -> String
    {
        var szReturn: String = "Voici les statisques du jeu au \(m_iNumberOfLoops)" + (m_iNumberOfLoops == 1 ? "er" : "eme") + " tour :\n"
        
        for player in m_aoPlayers
        {
            if(player.isAlive())
            {
                if(gameIsOver())
                {
                    print("\(player.getPlayerName()) a gagné")
                }
                szReturn += player.displayTeam()
            }
            else
            {
                szReturn += "\(player.getPlayerName()) a perdu\n"
            }
        }
        
        if(gameIsOver())
        {
            szReturn += "Game is OVER"
        }
        
        return szReturn
    }
    
    
    //function to ask a question and get for an Int value beetween iMin included and iMax included
    // if not correct, the function ask the same question again
    static func askForAInt(szQuestion : String, iMin: Int, iMax: Int) -> Int
    {
        var iReturn = Int.max
        
        while(iReturn == Int.max)
        {
            print(szQuestion,terminator: "")
            print("(valeur entre \(iMin) et \(iMax)) : ",terminator: "")

            if let szResponse = readLine()
            {
                if let iResponse = Int(szResponse)
                {
                    if(iResponse >= iMin && iResponse <= iMax)
                    {
                       iReturn = iResponse
                   }
                }
            }
        }
        
        return iReturn
    }
    
    //function to ask a question and get response as a String
    static func askForAString(question szQuestion : String) -> String
    {
        var szReturn: String = ""
        
        while(szReturn.isEmpty)
        {
            print(szQuestion, terminator: "")
            if let szRead = readLine()
            {
                szReturn =  szRead
            }
        }

        return szReturn
    }
    
    
    //Return true if minimum 2 players still alive
    private func gameIsOver() -> Bool
    {
        var iPlayersAliveCount: Int = 0
        
        
        for player in m_aoPlayers
        {
            if(player.isAlive())
            {
                iPlayersAliveCount += 1
            }
        }
        
        return (iPlayersAliveCount <= 1)
    }

}
