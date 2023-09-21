//
//  Dagger.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation


class Dagger : Weapon
{
    override init()
    {
        super.init()
        m_iDamage = 5
        m_szTypeName = "poignard"
    }
}
