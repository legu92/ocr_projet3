//
//  main.swift
//  OCR_p3_Game
//
//  Created by Stéphane LEGUILLIER on 19/09/2023.
//

import Foundation

//Step 1
print("=================================================")
print("===== Bienvenue dans le super jeu de combat =====")
print("=================================================")
print("")
let oGame : Game = Game() //to init the game and ask the configuration of each player

//Step 2
oGame.play() //step 2 of the game, loop that manage the figths


//Step 3
//The game is over, just to print the statistics
print("")
print("=============================")
print("=====     GAME OVER    ======")
print("=============================")

print(oGame.showStatistics())
