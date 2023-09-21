//
//  Weapon.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Weapon
{
    internal var m_iDamage : Int
    internal var m_szTypeName : String
    
    init()
    {
        m_iDamage = 0
        m_szTypeName = "arme"
    }
    
    func getDamage()-> Int
    {
        return m_iDamage
    }
    
    func getTypeName() -> String
    {
        return m_szTypeName
    }
    
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
