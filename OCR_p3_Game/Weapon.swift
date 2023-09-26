//
//  Weapon.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Weapon
{
    internal var iDamage : Int
    internal var szTypeName : String
    
    init()
    {
        self.iDamage = 0
        self.szTypeName = "arme"
    }
    
    /// give de damage that the character can apply to its opponent
    /// - Returns: point that must be reduce on the life points of the opponent
    func getDamage()-> Int
    {
        return self.iDamage
    }
    
    /// Get the name of the type of the character
    /// - Returns: name of the type
    func getTypeName() -> String
    {
        return self.szTypeName
    }
    
    /// Static function that have to be called to create the weapon that matchs to the character passed in argument
    /// - Parameter oType: type of the character that the weapon will be created
    /// - Returns: the weaopon created. Some Character could have no wepon  associated
    static func createWeapon(type oType : CharacterFactory.CharacterType) -> Weapon?
    {
        switch(oType)
        {
            case .Dwarf:
                return Chopped()
            
            case .Magus:
                return nil
            
            case .Warrior:
                return Sword()
        }
    }
    
}
