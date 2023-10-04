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
    //to avoid double in character names by storing pointers of all the characters
    var aoCharacters : [Character] = []
    
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
    }
    
    ///Create the character depending the character type choose by the user
    /// - Parameters:
    ///   - oCarType: Type of character to create (emum)
    ///   - szName: Name to give to the character
    /// - Returns: the character creater (could be nil if the type does not match)
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
            if let oCharacterTmp = oReturn
            {
                self.aoCharacters.append(oCharacterTmp)
            }
        }
        
        return oReturn
    }
    
    ///just to check if the Character name is not used before
    /// - Parameter szName: name proposed for the character
    /// - Returns: true if this name can be used
    public func isValidCharacterName(name szName : String) -> Bool
    {
        return (self.aoCharacters.filter{$0.getName().uppercased() == szName.uppercased()}).isEmpty

    }
    
}
