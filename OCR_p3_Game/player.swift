//
//  player.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Player
{
    private var m_aoCharacters : [Character] = []
    private let m_szName: String
    
    //create the 3 Characters for the player by asking the user which kind of Character he wants
    //The user choose the name of the Character and check its validity using the factory
    init(name szName : String, characterFactory oFactory : CharacterFactory)
    {
        var szCharacterName : String
        var szQuestion : String
        var szQuestionType : String = "Merci de choisir un type de personnage : \n"
        var iLoop : Int = 1
        
        m_szName = szName
        
        szQuestionType += CharacterFactory.CharacterType.allCases.enumerated().reduce(""){$0 + "\t[\($1.offset+1)]\t\($1.element) \n"}
        
        //        for type in CharacterFactory.CharacterType.allCases
        //        {
        //            szQuestionType += "[\(iLoop)] \(type)   "
        //            iLoop += 1
        //        }
        
        
        for _ in 0...2
        {
            szQuestion = "Nom du personnage : "
            repeat
            {
                szCharacterName = Game.askForAString(question: szQuestion)
                szQuestion = "\(szCharacterName) existe déja ! Nom du personnage ? "
            }
            while(!oFactory.isValidCharacterName(name: szCharacterName))
                    
                    let iChoice = Game.askForAInt(szQuestion: szQuestionType, iMin: 1, iMax: CharacterFactory.CharacterType.allCases.count)
                    
                    if let oNewCharacter = oFactory.createCharacter(type: CharacterFactory.CharacterType.allCases[iChoice-1], name: szCharacterName)
            {
                m_aoCharacters.append(oNewCharacter)
                print("Personnage \(oNewCharacter.getName()) a été créé")
            }
        }
    }
    
    func getPlayerName() -> String
    {
        return m_szName
    }
    
    func displayTeam() -> String
    {
        var szReturn : String
        
        szReturn = m_aoCharacters.reduce("Team \(getPlayerName()) :\n"){$0 + "\t\($1.toString())\n"}
//        for i in 0...2
//        {
//            szReturn += m_aoCharacters[i].toString() + "\n"
//        }
        
        return szReturn
    }
    
    //a player is alive while a minimum of 1 Character isAlive()
    func isAlive() -> Bool
    {
        var bReturn: Bool = false
        
        for character in m_aoCharacters
        {
            bReturn = character.isAlive() || bReturn
        }
        
        return bReturn
    }
    
    //play one trick by the player
    //It proposes to choose one of its alive characters (call chooseCharacter())
    //then ask for an action (cure or fight)
    //then, depending of the action, propose to choose the character in its own characters (case cure)
    //or in the characters of the opponent player (by calling its own chooseCharacter() method
    func playTrickAginst(opponent oOpponent : Player)
    {
        var oCharacter1, oCharacter2: Character
        var iChoice: Int
        
        print("joueur \(getPlayerName()), à toi de jouer contre \(oOpponent.getPlayerName()) :")
        oCharacter1 = chooseCharacter()
        iChoice = Game.askForAInt(szQuestion: "Que voulez-vous faire : [1] Attaquer   [2] Soigner :", iMin: 1, iMax: 2)
        
        switch(iChoice)
        {
            case 1:
                print("choississez le personnage de votre adversaire à combattre...")
                oCharacter2 = oOpponent.chooseCharacter()
                oCharacter1.fightAgainst(opponent: oCharacter2)
                print(oOpponent.displayTeam())
            case 2:
                print("Qui voulez-vous soigner ?")
                oCharacter2 = chooseCharacter() //A Character can care himself
                oCharacter1.cure(teammate: oCharacter2)
                print(displayTeam())
            default:
                print("choix impossible...")
        }
        
        
    }
    
    //display a question with only the Character alive of the player
    //a tmp array permits to select the alive character
    private func chooseCharacter()->Character
    {
        var szQuestion: String
        var aoPossibleCharacter: [Character]
   
        aoPossibleCharacter = m_aoCharacters.filter{$0.isAlive()}
//        for oCaracter in m_aoCharacters
//        {
//            if(oCaracter.isAlive())
//            {
//                aoPossibleCharacter.append(oCaracter)
//            }
//        }
       
        if(aoPossibleCharacter.count > 1)
        {
            szQuestion = aoPossibleCharacter.enumerated().reduce("Quel personnage choisis-tu ?\n"){$0 + "\t[\($1.offset+1)]\t\($1.element.toString())\n"}
            //        for i in 1...aoPossibleCharacter.count
            //        {
            //            szQuestion += "   [\(i)] \(aoPossibleCharacter[i-1].toString())\n"
            //        }
            //        szQuestion += "Quel personnage choisissez-vous ? "
            
            let iResponse = Game.askForAInt(szQuestion: szQuestion, iMin: 1, iMax: aoPossibleCharacter.count)
            
            return aoPossibleCharacter[iResponse-1]
        }
        else
        {
            //une seule possibilité, on ne demande pas de choisir
            print("il ne reste qu'un seul personnage :")
            print("\t\(aoPossibleCharacter[0].toString())")
            return aoPossibleCharacter[0]
        }
        
                
    }
    
}
