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
        m_iDamage = 10
        m_szTypeName = "épée"
    }
}
