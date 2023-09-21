//
//  Warrior.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Warrior : Character
{
    override init(name szName: String)
    {
        super.init(name: szName)
        m_oWeapon = Weapon.createWeapon(type: CharacterFactory.CharacterType.Warrior)
        m_iLifePoints = 50
        m_iCarePoints = 0
    }
    
    override func getTypeName() -> String
    {
        return "Warrior"
    }
}
