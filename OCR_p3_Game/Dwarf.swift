//
//  Dwarf.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Dwarf : Character
{

    
    /// Use a specific profil for the character
    /// - Parameter szName: name given to the character
    override init(name szName: String)
    {
        super.init(name: szName)
        self.oWeapon = Weapon.createWeapon(type: CharacterFactory.CharacterType.Dwarf)
        self.iLifePoints = 20
        self.iCarePoints = 0
    }
}
