//
//  main.swift
//  Who_Wants_To_Be_A_Millionare
//
//  Created by Maham Shamail on 31/10/2020.
//  Copyright © 2020 Maham Shamail. All rights reserved.
//

import Foundation


var player = Player()
print(player.welcomeMessageToPlayer)

let difficulty  = player.difficultyChosenByPlayer

print("Difficulty Set to: \(difficulty)")
print("------------------------------------------------------------------------")
if(difficulty == "Hard"){
    let hard_game = Hard_Game(player: player)
    hard_game.playHardGame()
}else if (difficulty == "Easy"){
    let easy_game = Easy_Game(player: player)
    easy_game.playEasyGame()
}else{
    print("level does not exist")
}

/*
 inheritence
 ------------
 Game - superclass
 Easy game - sub class
 hard game - sub class
 
 question bank
 
 structs
 --------
 question
 player
 
 enum
 -----
 money
 
 */



