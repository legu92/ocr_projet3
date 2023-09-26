//
//  Sword.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation

class Sword : Weapon
{
    
    override init()
    {
        super.init()
        self.iDamage = 10
        self.szTypeName = "épée"
    }
}
