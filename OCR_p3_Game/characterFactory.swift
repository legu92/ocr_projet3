//
//  CharacterFactory.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class CharacterFactory
{
    var m_aoCharacterNames : [String] = []
    
    public enum CharacterType : String, CaseIterable
    {
        case Dwarf = "Sa hache vous infligera beaucoup de dégats, mais il n'a pas beaucoup de points de vie"
        case Magus = "Son talent ? Soigner les membres de son équipe"
        case Warrior = "L'attaquant classique. Un bon guerrier !"
    }
    
    init()
    {
        print("voici la liste de type de personnages que vous pouvez créer :")
        for type in CharacterType.allCases
        {
            print("\t\(type)\t : \(type.rawValue)")
        }
    }
    
    
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
    
    
    public func isValidCharacterName(name szName : String) -> Bool
    {
        return !m_aoCharacterNames.contains(szName)
    }
    
}
