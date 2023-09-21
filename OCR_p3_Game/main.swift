//
//  main.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation

print("=================================================")
print("===== Bienvenue dans le super jeu de combat =====")
print("=================================================")
print("")

let oGame : Game = Game()

oGame.play()
print("")
print("=============================")
print("=====     GAME OVER    ======")
print("=============================")

print(oGame.showStatistics())
