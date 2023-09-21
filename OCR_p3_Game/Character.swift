//
//  Character.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation

class Character
{
    private let m_szName : String
    internal var m_iLifePoints : Int = 0
    internal var m_iCarePoints: Int = 0
    internal var m_oWeapon : Weapon?
    
    init(name szName: String)
    {
        m_szName = szName
        m_oWeapon = nil
    }
    
    func getName() -> String
    {
        return m_szName
    }
    
    func getTypeName() -> String
    {
        return "Unknown"
    }
    
    func isAlive() -> Bool
    {
        return m_iLifePoints>0
    }
    
    func getDamage() -> Int
    {
        return (m_oWeapon != nil ? m_oWeapon!.getDamage() : 0)
    }
    
    func getLifePoints() -> Int
    {
        return m_iLifePoints
    }
    
    func getCarePoints() -> Int
    {
        return m_iCarePoints
    }
    
    
    func fightAgainst(opponent oOpponent : Character) -> Bool
    {
        var bReturn : Bool = false
        
        if(oOpponent.isAlive())
        {
            oOpponent.m_iLifePoints -= getDamage()
            if(!oOpponent.isAlive())
            {
                print("Le personnage \(oOpponent.getName()) est maintenant mort, paix à son âme...")
            }
            else
            {
                print("\(oOpponent.getName()) s'accroche, il lui reste \(oOpponent.getLifePoints()) points de vie")
            }
            bReturn = true
        }
        else
        {
            print("facile de s'en prendre aux morts, quel honte !")
        }
        
        return bReturn
    }
    
    func cure(teammate oCharToCure : Character) -> Bool
    {
        var bReturn : Bool = false
        
        if(oCharToCure.isAlive())
        {
            oCharToCure.m_iLifePoints += getCarePoints()
            print("\(oCharToCure.getName()) vous remercie, il va mieux avec \(oCharToCure.getLifePoints()) points de vie")
            bReturn = true
        }
        else
        {
            print("Impossible de ranimer \(oCharToCure.getName()), tu n'as pas les pouvoirs pour le ramener à la vie")
        }
        
        return bReturn
    }
    
    func hasWeapon() -> Bool
    {
        return m_oWeapon != nil
    }
    
    func getWeaponName() -> String?
    {
        if let oWeapon = m_oWeapon
        {
            return oWeapon.getTypeName()
        }
        else
        {
            return nil
        }
    }
    
    func toString() -> String
    {
        var szReturn: String
        
        szReturn = "\(getName())(\(getTypeName()))"
        if(isAlive())
        {
            szReturn += " [PV=\(getLifePoints()) - Care=\(getCarePoints()) - Domage=\(getDamage())"
            if let szWeaponName = getWeaponName()
            {
                szReturn += "(\(szWeaponName))"
            }
            szReturn += "]"
        }
        else
        {
            szReturn += " [Mort pour l'équipe]"
        }
        
        return szReturn
    }
}
