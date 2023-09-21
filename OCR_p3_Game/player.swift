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
    
    init(name szName : String, caracterFactory oFactory : CharacterFactory)
    {
        var szCharacterName : String
        var szQuestion : String
        var szQuestionType : String = "Merci de choisir un type de personnage : "
        var iLoop : Int = 1
        
        m_szName = szName
        
        for type in CharacterFactory.CharacterType.allCases
        {
            szQuestionType += "[\(iLoop)] \(type)   "
            iLoop += 1
        }
        szQuestionType += "? "
        
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
        var szReturn = "Team \(getPlayerName()) :\n"
        
        for i in 0...2
        {
            szReturn += m_aoCharacters[i].toString() + "\n"
        }
        
        return szReturn
    }
    
    func isAlive() -> Bool
    {
        var bReturn: Bool = false
        
        for character in m_aoCharacters
        {
            bReturn = character.isAlive() || bReturn
        }
        
        return bReturn
    }
    
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
    
    private func chooseCharacter()->Character
    {
        var szQuestion: String = ""
        var aoPossibleCharacter: [Character] = []
        
        for oCaracter in m_aoCharacters
        {
            if(oCaracter.isAlive())
            {
                aoPossibleCharacter.append(oCaracter)
            }
        }
        
        for i in 1...aoPossibleCharacter.count
        {
            szQuestion += "   [\(i)] \(aoPossibleCharacter[i-1].toString())\n"
        }
        szQuestion += "Quel personnage choisissez-vous ? "
        
        let iResponse = Game.askForAInt(szQuestion: szQuestion, iMin: 1, iMax: aoPossibleCharacter.count)
        
        return aoPossibleCharacter[iResponse-1]
                
    }
    
}
