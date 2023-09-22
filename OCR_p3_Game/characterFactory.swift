//
//  CharacterFactory.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation

//Factory to create the characters by type selected by the user
class CharacterFactory
{
    //to avoid double in character names
    var m_aoCharacterNames : [String] = []
    
    //emum to be completed in case of new Characters. Use to do a good switch case for creation
    public enum CharacterType : String, CaseIterable
    {
        case Dwarf = "Sa hache vous infligera beaucoup de dégats, mais il n'a pas beaucoup de points de vie"
        case Magus = "Son talent ? Soigner les membres de son équipe"
        case Warrior = "L'attaquant classique. Un bon guerrier !"
    }
    
    //just to display the list of characters available
    init()
    {
        print("voici la liste de type de personnages que vous pouvez créer :")
        print(CharacterType.allCases.reduce(""){$0 + "\t\($1)\t : \($1.rawValue)\n"})
//        for type in CharacterType.allCases
//        {
//            print("\t\(type)\t : \(type.rawValue)")
//        }
    }
    
    //Create the character depending the character type choose by the user
    public func createCharacter(type oCarType : CharacterFactory.CharacterType, name szName : String) -> Character?
    {
        var oReturn : Character?
        
        if(isValidCharacterName(name: szName))
        {
            switch(oCarType)
            {
                case .Dwarf:
                    oReturn = Dwarf(name: szName)
                case .Magus:
                    oReturn = Magus(name: szName)
                case .Warrior:
                    oReturn = Warrior(name: szName)
            }
            m_aoCharacterNames.append(szName)
        }
        
        return oReturn
    }
    
    //just to check if the Character name is not used before
    public func isValidCharacterName(name szName : String) -> Bool
    {
        return !m_aoCharacterNames.contains(szName)
    }
    
}
