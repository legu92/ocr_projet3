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
        self.oWeapon = Weapon.createWeapon(type: CharacterFactory.CharacterType.Warrior)
        self.iLifePoints = 50
        self.iCarePoints = 0
    }
}
