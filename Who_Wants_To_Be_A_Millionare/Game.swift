//
//  Game.swift
//  Who_Wants_To_Be_A_Millionare
//
//  Created by Maham Shamail on 06/11/2020.
//  Copyright © 2020 Maham Shamail. All rights reserved.
//

import Foundation
class Game{
    var nameOfTheGame: String = "|WHO WANTS TO BE A MILLIONARE|"
    var rulesOfTheGame: String = "RULES"
    let questions : QuestionBank = QuestionBank()
    var player : Player
    var fiftyFiftyUsed: Bool = false
    var phoneAFriendUsed: Bool = false
    var askTheAudienceUsed: Bool = false
    init(player: Player) {
        self.player = player
    }
    func AskAQuestion(roundNum: Int, difficulty: String){
        let questionBeingAsked = questions.generateRandomQuestionToAsk()
        print("------------------------------------------------------------------------")
        print("|QUESTION: \(questionBeingAsked.question)")
        print("------------------------------------------------------------------------")
        let options = questionBeingAsked.options
        print("|OPTIONS:- ")
        print("------------------------------------------------------------------------")
        for (i, option) in options.enumerated(){
            print("| -> Press \(i+1) to select: \(option)|                                   ")
            print("------------------------------------------------------------------------")
        }
        if(roundNum == 1 && difficulty == "Hard"){
        }
        else{
            print("-> Press 5 to access a life line.")
            print("------------------------------------------------------------------------")
        }
    }
    func endOfRound(question: Int, round: Int, money: Int, answerNumber: Int){
        //method overridden in subclass
    }
    
    func askForOption(askStatement: String ) -> Int{
        var input : String?
        var result: Int = 0
        var resultIsSet: Bool = false
        while(!resultIsSet){
            print("Enter \(askStatement): ")
            input = readLine()
            guard let resultUnwrapped = Int(input!), resultUnwrapped > 0 , resultUnwrapped < 6  else {
                print("Invalid Input. Try again.")
                continue
            }
            resultIsSet.toggle()
            result = resultUnwrapped
            print("Answer set to: \(result)")
        }
        return result
    }
    func confirmAnswer(askStatement: String, option:Int ) -> Int{
        var input : String?
        let result: Bool = false
        var resultIsSet: Bool = false
        var answer = 0
        while(!resultIsSet){
            print(askStatement)
            input = readLine()
            guard let resultUnwrapped = input else {
                print("Could not confirm answer. Try Again.")
                continue
            }
            resultIsSet.toggle()
            if(resultUnwrapped.uppercased() == "Y"){
                resultIsSet = true
                print("Option \(option) Confirmed: \(resultIsSet).")
                //move to next question or next round
                answer = option
            }
            else if (resultUnwrapped.uppercased() == "N"){
                resultIsSet = true
                print("Option \(option) Confirmed: \(result).")
                //reask option and confirm answer again
                answer = askForOption(askStatement: "your option again: ")
            }
            else{
                resultIsSet = false
                print("Invalid answer try again.")
            }
        }
        return answer
    }
    
    func askForAString(askStatement: String ) -> String{
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
                  resultIsSet.toggle()
                  result = resultUnwrapped
               print("\(askStatement) set to: \(result)")
              }
        return result
    }

    func fiftyFifty(options: [String], correct_answer: String)  -> (twoOptions: [String], correctAnswerNumber: Int){
        //print("inside 5050 func")
        var random_1 = Int.random(in: 0...3)
        while options[random_1] == correct_answer {
            random_1 = Int.random(in: 0...3)
        }
        var new_options: [String] = []
        let random_2 = Int.random(in: 0...1)
        if(random_2 == 0){
            new_options.append(correct_answer)
            new_options.append(options[random_1])
        }
        else{
             new_options.append(options[random_1])
             new_options.append(correct_answer)
        }
        //print("leaving 5050 func")
        return ( new_options, random_2)
    }
    
    func phoneAFriend(options: [String]) -> Int {
        let random = Int.random(in: 0...3)
        return random
        
    }
    func askTheAudience() -> [Int] {
        var votesFromTheAudience : [Int] = [0,0,0,0]
        for _ in 1...100{
            let random = Int.random(in: 0...3)
            votesFromTheAudience[random] += 1
        }
        return votesFromTheAudience
    }

    func lifeLines(lifeLineNumber: Int) -> Int {
        if lifeLineNumber == 0 && !fiftyFiftyUsed{
            //print("in life liness 50 50")
            fiftyFiftyUsed = true
            // 5050
           let fifty = fiftyFifty(options: questions.questionBeingAsked!.options, correct_answer: questions.questionBeingAsked!.correctAnswer)
            let fiftyArr = fifty.twoOptions
           
            let answer = askForAnInt(askStatement: "Two wrong options have been eliminated.\nNow chooce from the options below:\n -> Press 1 to select \(fiftyArr[0])\n -> Press 2 to select \(fiftyArr[1])\n------------------------------------------------------------------------\nYour Answer:")
            var answerNumber = 0
            for (i,option) in questions.questionBeingAsked!.options.enumerated(){
                if(fiftyArr[answer - 1] == option){
                    answerNumber = i+1
                    //print(fiftyArr[fiftyCorrectAnsNum])
                }
            }
            return answerNumber
                
        }
        else if lifeLineNumber == 1 && !phoneAFriendUsed {
            //phone friend
            phoneAFriendUsed = true
            print("Calling friend...")
            let ans = phoneAFriend(options: questions.questionBeingAsked!.options)
            print("Friend selected: option \(ans+1) \(questions.questionBeingAsked!.options[ans])")
            
            return ans+1
            
            
        }
        else if lifeLineNumber == 2 && !askTheAudienceUsed {
            // ask audience
            askTheAudienceUsed.toggle()
            let askAudience = askTheAudience()
            print("Enter your choice based on audience's answers: ")
            var i = 0
            while i < 4 {
                print(" -> Press \(i+1) to select \(questions.questionBeingAsked!.options[i]) - \(askAudience[i]) %")
                i = i + 1
            }
            let ans = askForOption(askStatement: "your answer again:")
            return ans
            
        }
        else{
            //ask for option again
            print("That life line is not available.")
            let ans = askForOption(askStatement: "your answer.\nNow you must choose from the options given above.\nSelect Option Number:")
            return ans
            
        }

    }
    func askForAnInt(askStatement: String ) -> Int{
        var input : String?
        var result: Int = -1
              var resultIsSet: Bool = false
              while(!resultIsSet){
                  print(askStatement)
                  input = readLine()
                  guard let resultUnwrapped = Int(input!)  else {
                      print("Answer could not be set. Try again.")
                      continue
                  }
                if(resultUnwrapped == 1){
                    resultIsSet.toggle()
                    result = resultUnwrapped
                    print("You have chosen option 1")
                }
                else if(resultUnwrapped == 2){
                    resultIsSet.toggle()
                    result = resultUnwrapped
                    print("You have chosen option 2")
                }
                else{
                    print("Invalid Input. Try Again")
                }
                 
              }
        return result
    }
    func lifeLinesLeft() -> String {
        
        var lifeLines: String = "------------------------------------------------------------------------\nLife-Lines Left: "
        if(!fiftyFiftyUsed){
            lifeLines += "\n -> Press 1 for Fifty-fifty"
        }
        if(!phoneAFriendUsed){
            lifeLines += "\n -> Press 2 for  Phones a friend"
        }
        if(!askTheAudienceUsed){
            lifeLines += "\n -> Press 3 for  Ask the audience"
        }
        lifeLines += "\n------------------------------------------------------------------------"

        
        return lifeLines
    }
    func askForInput(askStatement: String ) -> String{
         var input : String?
         var result: String = "Not Set"
               var resultIsSet: Bool = false
               while(!resultIsSet){
                   print(askStatement)
                   input = readLine()
                   guard let resultUnwrapped = input  else {
                       print("Invalid Input. Try again.")
                       continue
                   }
                   resultIsSet.toggle()
                   result = resultUnwrapped
                print("Answer set to: \(result)")
               }
         return result
     }
     func askForALifeLine(askStatement: String ) -> Int{
         var input : String?
         var result: Int = -1
               var resultIsSet: Bool = false
               while(!resultIsSet){
                   print(askStatement)
                   input = readLine()
                   guard let resultUnwrapped = Int(input!)  else {
                       print("Answer could not be set. Try again.")
                       continue
                   }
                 if(resultUnwrapped == 1){
                     resultIsSet.toggle()
                     result = resultUnwrapped
                     print("You have chosen life line 50:50")
                     print("------------------------------------------------------------------------")
                 }
                 else if(resultUnwrapped == 2){
                     resultIsSet.toggle()
                     result = resultUnwrapped
                     print("You have chosen life line phone a friend")
                    print("------------------------------------------------------------------------")
                 }
                 else if(resultUnwrapped == 3){
                     resultIsSet.toggle()
                     result = resultUnwrapped
                     print("You have chosen life line ask the audience")
                    print("------------------------------------------------------------------------")
                 }
                 else{
                     print("Invalid Input. Try Again")
                 }
                  
               }
         return result
     }
}
