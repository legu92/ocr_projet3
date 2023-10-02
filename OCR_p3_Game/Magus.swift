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
        self.oWeapon = Weapon.createWeapon(type: CharacterFactory.CharacterType.Magus)
        self.iLifePoints = 10
        self.iCarePoints = 20
    }
}
