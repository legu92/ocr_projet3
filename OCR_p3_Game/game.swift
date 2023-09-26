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
    private var iNumberOfLoops: Int = 0 //count the number of loops for statistics at the end
    
    private var aoPlayers : [Player] = [] //Players to play the game
    
    //Factory to create the Character by the player choice
    private var oMyCharactersFactory = CharacterFactory()
    

    /// called automatically by creating the instance of the Game
    ///Create the players objets for the 2 players choosen with its name
    ///display a resume of the player
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
            self.aoPlayers.append(Player(name: szName, characterFactory: self.oMyCharactersFactory))
            print("")
            print(self.aoPlayers[i].displayTeam())
            print("")
        }
    }
    

    ///The method is a loop that alternitavely give the hand to each player to play
    ///The loop ends when the game is over (just 1 player left)
    ///for each pass, it delegates to the objet Player the turn
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
            self.iNumberOfLoops += 1
            print("")
            print("----  \(self.iNumberOfLoops)", terminator: "")
            print( (self.iNumberOfLoops == 1 ? "er" : "eme") + " tour  -----")
            self.aoPlayers[self.iNumberOfLoops%2].playTrickAginst(opponent: self.aoPlayers[(self.iNumberOfLoops+1)%2])

            print("")
        }
        while(!gameIsOver())
        
        
    }
    
    /// Display all the statistics of the game
    /// - Returns: A string to display the all statistics
    func showStatistics() -> String
    {
        var szReturn: String = "Voici les statisques du jeu au \(self.iNumberOfLoops)" + (self.iNumberOfLoops == 1 ? "er" : "eme") + " tour :\n"
        
        //a loop on each player
        for player in self.aoPlayers
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
    
    
    ///function to ask a question and get for an Int value beetween iMin included and iMax included
    /// if not correct, the function ask the same question again
    /// - Parameters:
    ///   - szQuestion: string that represent the question to ask
    ///   - iMin: min value accepted in the response (included)
    ///   - iMax: max value accepted in the response (included)
    /// - Returns: the value of the answer
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
                    else
                    {
                        print("valeur incorrecte, elle doit être entre \(iMin) et \(iMax)) : ",terminator: "")
                    }
                }
            }
        }
        
        
        return iReturn
    }
                              
    ///function to ask a question and get for an string value not empty for the answer
    /// - Parameters:
    ///   - szQuestion: string that represent the question to ask
    /// - Returns: the value of the answer
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
                              
   ///Return true if minimum 2 players still alive
   /// - Returns: boolean

    private func gameIsOver() -> Bool
    {
        var iPlayersAliveCount: Int = 0
        
        
        for player in self.aoPlayers
        {
            if(player.isAlive())
            {
                iPlayersAliveCount += 1
            }
        }
        
        return (iPlayersAliveCount <= 1)
    }

}
