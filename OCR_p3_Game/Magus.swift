//
//  Magus.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Magus : Character
{
    
    override init(name szName: String)
    {
        super.init(name: szName)
        m_oWeapon = Weapon.createWeapon(type: CharacterFactory.CharacterType.Magus)
        m_iLifePoints = 10
        m_iCarePoints = 50
    }

    override func getTypeName() -> String
    {
        return "Magus"
    }
}
