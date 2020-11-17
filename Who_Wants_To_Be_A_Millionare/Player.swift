//
//  Player.swift
//  Who_Wants_To_Be_A_Millionare
//
//  Created by Maham Shamail on 06/11/2020.
//  Copyright © 2020 Maham Shamail. All rights reserved.
//

import Foundation
struct Player {
    var name : String?
    var difficultyChosenByPlayer: String {
        get{
            let askStatement = "Choose Difficulty Level :\n -> Press E for Easy\n -> Press H for Hard" + "\n------------------------------------------------------------------------" + "\nInput: "
            var input : String?
            var result: String = "Not Set"
            var resultIsSet: Bool = false
            while(!resultIsSet){
                print(askStatement)
                input = readLine()
                print("------------------------------------------------------------------------")
                guard let resultUnwrapped = input  else {
                    print("ERROR: Invalid Input \(input!). Try again.")
                    print("------------------------------------------------------------------------")
                    continue
                }
                if(resultUnwrapped.uppercased() == "H"){
                    //print("Hard")
                    resultIsSet.toggle()
                    result = "Hard"
                    //print("Difficulty set to: \(result)")
                }
                else if(resultUnwrapped.uppercased() == "E"){
                    //print("Easy")
                    resultIsSet.toggle()
                    result = "Easy"
                    //print("Difficulty set to: \(result)")
                }
                else{
                    print("ERROR: Difficulty could not be set, try again!")
                       print("------------------------------------------------------------------------")
                }
                
            }
            return result
        }
    }
    func askPlayerName(askStatement: String ) -> String{
        print("------------------------------------------------------------------------")
        print("               WELCOME TO WHO WANTS TO BE A MILLIONARE")
        print("------------------------------------------------------------------------")
        var input : String?
        var result: String = "Not Set"
        var resultIsSet: Bool = false
          while(!resultIsSet){
              print("Enter \(askStatement) :")
              input = readLine()
              guard let resultUnwrapped = input  else {
                  print("\(askStatement) could not be set. Try again.")
                  continue
              }
              resultIsSet.toggle()
              result = resultUnwrapped
            print("\(askStatement) set to: \(result.uppercased())")
          }
        return result
    }
    
    var welcomeMessageToPlayer: String{
        mutating get{
           let playerName = self.askPlayerName(askStatement: "Name")
           self.name = playerName
           let message =
            "------------------------------------------------------------------------" +
            "\n                        HEY \(playerName.uppercased())!" +
            "\n------------------------------------------------------------------------"
            return message
        }
    }
    
    func earnsMoney(questionNumber: Int, roundNumber: Int, difficultyLevel: String) -> Int{
       // if(difficultyLevel == "Hard"){
        if roundNumber == 1 {
            if difficultyLevel == "Hard" {
                if questionNumber == 1 {
                    return Hard_Game_Round_1.Question_1_Money.rawValue
                }
                else if(questionNumber == 2) {
                    return Hard_Game_Round_1.Question_2_Money.rawValue
                }
                else if(questionNumber == 3) {
                    return Hard_Game_Round_1.Question_3_Money.rawValue
                }
                else if(questionNumber == 4) {
                    return Hard_Game_Round_1.Question_4_Money.rawValue
                }
                else if(questionNumber == 5) {
                    return Hard_Game_Round_1.Question_5_Money.rawValue
                }
                else{
                  return 0
                }
            } else {
                if questionNumber == 1 {
                    return Easy_Game_Round_1.Question_1_Money.rawValue
                }
                else if(questionNumber == 2) {
                    return Easy_Game_Round_1.Question_2_Money.rawValue
                }
                else if(questionNumber == 3) {
                    return Easy_Game_Round_1.Question_3_Money.rawValue
                }
                else{
                    return 0
                }
            }
                
        }
        else if(roundNumber == 2) {
            if difficultyLevel == "Hard" {
                if questionNumber == 1 {
                    return Hard_Game_Round_2.Question_1_Money.rawValue
                 }
                  else if(questionNumber == 2) {
                    return Hard_Game_Round_2.Question_2_Money.rawValue
                 }
                  else if(questionNumber == 3) {
                      return Hard_Game_Round_2.Question_3_Money.rawValue
                 }
                  else if(questionNumber == 4) {
                        return Hard_Game_Round_2.Question_4_Money.rawValue
                 }
                  else if(questionNumber == 5) {
                        return Hard_Game_Round_2.Question_5_Money.rawValue
                 }
                 else{
                        return 0
                  }
            }
            else {
                if questionNumber == 1 {
                  return Easy_Game_Round_2.Question_1_Money.rawValue
                }
                else if(questionNumber == 2) {
                  return Easy_Game_Round_2.Question_2_Money.rawValue
                }
                else if(questionNumber == 3) {
                    return Easy_Game_Round_2.Question_3_Money.rawValue
                }
                else{
                    return 0
                }
            }
               
        }
        else if(roundNumber == 3) {
            if difficultyLevel == "Hard" {
                if questionNumber == 1 {
                    return Hard_Game_Round_3.Question_1_Money.rawValue
                }
                else if(questionNumber == 2) {
                    return Hard_Game_Round_3.Question_2_Money.rawValue
                }
                else if(questionNumber == 3) {
                    return Hard_Game_Round_3.Question_3_Money.rawValue
                }
                else if(questionNumber == 4) {
                    return Hard_Game_Round_3.Question_4_Money.rawValue
                }
                else if(questionNumber == 5) {
                    return Hard_Game_Round_3.Question_5_Money.rawValue
                }
                else{
                    return 0
                }
            }
            else {
                 if questionNumber == 1 {
                   return Easy_Game_Round_3.Question_1_Money.rawValue
                 }
                 else if(questionNumber == 2) {
                   return Easy_Game_Round_3.Question_2_Money.rawValue
                 }
                 else if(questionNumber == 3) {
                     return Easy_Game_Round_3.Question_3_Money.rawValue
                 }
                 else{
                     return 0
                 }
            }
            
        }
        else{
                return 0
        }
    }
}
