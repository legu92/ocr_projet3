//
//  Character.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation

/// This classe is the base classe for all the characters
class Character
{
    private let szName : String
    internal var iLifePoints : Int = 0
    internal var iCarePoints: Int = 0
    internal var oWeapon : Weapon?
    
    /// Initialisation of the object
    /// - Parameter szName: name to give to the Character
    init(name szName: String)
    {
        self.szName = szName
        self.oWeapon = nil
    }
    
    /// Gives the name used to create tje Character
    /// - Returns: Character name
    func getName() -> String
    {
        return self.szName
    }
    
    /// Return the type of the character. Each subclasse override the function to return the correct type
    /// - Returns: type name of the character
    func getTypeName() -> String
    {
        return String(describing: type(of: self))
    }
    
    /// return true if the character still have some life points
    /// - Returns: true if the character is alive
    func isAlive() -> Bool
    {
        return self.iLifePoints>0
    }
    
    /// gives the number of life points the the character can take out the opponent
    /// - Returns: number of life points to reduce to the opponet
    func getDamage() -> Int
    {
        return (self.oWeapon != nil ? self.oWeapon!.getDamage() : 0)
    }
    
    /// gives the current life points that the character has
    /// - Returns: value of the current life points
    func getLifePoints() -> Int
    {
        return self.iLifePoints
    }
    
    /// return the life points that the character can add to one team character
    /// - Returns: value of life points to add to the team collegue
    func getCarePoints() -> Int
    {
        return self.iCarePoints
    }
    
    
    /// when the present character attack the opponent. it reduces his life points with the damage points
    /// - Parameter oOpponent: the character to attack
    /// - Returns: return true if the opponent was alive
    func fightAgainst(opponent oOpponent : Character) -> Bool
    {
        var bReturn : Bool = false
        
        if(oOpponent.isAlive())
        {
            oOpponent.iLifePoints -= getDamage()
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
    
    /// Use this function to cure one of your team collegue. It adds the cure points to the life points of your team collegue
    /// - Parameter oCharToCure: character to cure
    /// - Returns: return true if the character to cure was alive
    func cure(teammate oCharToCure : Character) -> Bool
    {
        var bReturn : Bool = false
        
        if(oCharToCure.isAlive())
        {
            oCharToCure.iLifePoints += getCarePoints()
            print("\(oCharToCure.getName()) te remercie, il va mieux avec \(oCharToCure.getLifePoints()) points de vie")
            bReturn = true
        }
        else
        {
            print("Impossible de réanimer \(oCharToCure.getName()), tu n'as pas les pouvoirs pour le ramener à la vie")
        }
        
        return bReturn
    }
    
    /// return true if the character has a weapon
    /// - Returns: true if weapon
    func hasWeapon() -> Bool
    {
        return self.oWeapon != nil
    }
    
    /// returns the weapon name
    /// - Returns: weapon name, can be nil if the character has no weapon
    func getWeaponName() -> String?
    {
        if let oWeaponTmp = self.oWeapon
        {
            return oWeaponTmp.getTypeName()
        }
        else
        {
            return nil
        }
    }
    
    /// returns a string that concatains all the information abour the character
    /// - Returns: character information resumed
    func toString() -> String
    {
        var szReturn: String
        
        szReturn = "\(getName())(\(getTypeName()))"
        if(isAlive())
        {
            szReturn += "\t[PV=\(getLifePoints()) - Care=\(getCarePoints()) - Domage=\(getDamage())"
            if let szWeaponName = getWeaponName()
            {
                szReturn += "(\(szWeaponName))"
            }
            szReturn += "]"
        }
        else
        {
            szReturn += "\t[Mort pour l'équipe]"
        }
        
        return szReturn
    }
}
