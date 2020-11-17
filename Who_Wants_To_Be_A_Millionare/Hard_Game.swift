//
//  Hard_Game.swift
//  Who_Wants_To_Be_A_Millionare
//
//  Created by Maham Shamail on 06/11/2020.
//  Copyright © 2020 Maham Shamail. All rights reserved.
//

import Foundation
class Hard_Game: Game{
    let difficultyLevel: String = "Hard"
    override init( player: Player) {
        super.init( player: player)
    }
    func playHardGame(){
        var roundCount = 1
        while(roundCount <= 3){
            playRound(roundNumber: roundCount)
            roundCount += 1
        }
    }
    func playRound(roundNumber: Int){
        //ask 3 question
        var questionCount = 0
        while questionCount < 5 {
            print("\n\n------------------------------------------------------------------------")
            print("|DIFFICULTY LEVEL: \(self.difficultyLevel) |ROUND: \(roundNumber) |Question Number: \(questionCount+1)|")
            self.AskAQuestion(roundNum: roundNumber, difficulty: self.difficultyLevel)
            questionCount = questionCount + 1
            let moneyEarned: Int = player.earnsMoney(questionNumber: questionCount, roundNumber: roundNumber, difficultyLevel: "Hard")
            print("NOTE-> THIS QUESTION IS WORTH: $\(moneyEarned) ($_$)")
            print("------------------------------------------------------------------------")
            var answerChosen = self.askForOption(askStatement: "Your Answer")
            // check if asks for life line
            if(answerChosen == 5){
                //life-line
                while answerChosen == 5 {
                    if roundNumber == 1  {
                        print("You cannot access life-lines in this round.")
                        answerChosen = self.askForOption(askStatement: "Your Answer")
                        answerChosen = self.confirmAnswer(askStatement: " -> Press Y to confirm your answer: Option \(answerChosen) -  \(questions.questionBeingAsked!.options[answerChosen-1]).\n -> Press N to change you answer.", option: answerChosen)
                    }
                    else{
                        print(self.lifeLinesLeft())
                        let lifeLineAsk = self.askForALifeLine(askStatement: "Choose your life-line: ")
                        answerChosen = self.lifeLines(lifeLineNumber: lifeLineAsk-1)
                    }
                }
                
            }else{
                answerChosen = self.confirmAnswer(askStatement: " -> Press Y to confirm your answer: Option \(answerChosen) -  \(questions.questionBeingAsked!.options[answerChosen-1]).\n -> Press N to change you answer.", option: answerChosen)
                while answerChosen == 5 {
                    print(self.lifeLinesLeft())
                    let lifeLineAsk = self.askForALifeLine(askStatement: "Choose your life-line: ")
                    answerChosen = self.lifeLines(lifeLineNumber: lifeLineAsk-1)
                }
            }
                
            self.endOfRound(question: questionCount, round: roundNumber, money: moneyEarned, answerNumber: answerChosen)
        }
    }
    override func endOfRound(question: Int, round: Int, money: Int, answerNumber: Int){

        print("------------------------------------------------------------------------")
        if (questions.questionBeingAsked!.correctAnswer != questions.questionBeingAsked!.options[answerNumber-1]){
            //print("question that was being answered: \(questions.questionBeingAsked!)")
            print("OPPS! INCORRECT ANSWER!")
            print("CORRECT ANSWER: \(questions.questionBeingAsked!.correctAnswer)")
            print("YOUR ANSWER: \(questions.questionBeingAsked!.options[answerNumber-1])")
            print("You Lost The Game! :( Better Luck Next Time.")
            // exit game
            exit(0)
        } else {
            if(question > 0 && question < 5 ){
               print("Congrats! Correct answer! <3\nYour earned $\(money) on this question!")
                
            }
            else if(question == 5){
                if( round == 1 || round == 2){
                     print("Congrats! Correct answer! <3\nYour earned $\(money) on this question!")
                    print("------------------------------------------------------------------------")
                    let choiceMessage = "You have the option to either walk away with the money you have: $\(money)\n         OR\nContinue to play the game.\n -> Press W to walk away witht the money.\n -> Press C to continue playing the game."
                               //take input
                    let choice = self.askForInput(askStatement: choiceMessage)
                    //walk away: print a message and exit the game or go back to main menu?
                    if(choice.uppercased() == "W"){
                        print("------------------------------------------------------------------------")

                        print("You have chosen to walk away with $\(money).\nCongrats!!!")
                        print("------------------------------------------------------------------------")

                        exit(0)
                    }
                    //continue playing: play next round
                    else if (choice.uppercased() == "C"){
                        print("Starting next round!")
                    }
                }
                else if(round == 3){
                    //win
                    print("YOU WON! YOU'RE A MILLIONAIRE NOW! WOHOOOOO!!")
                }
                else{
                }
            }
            else{
                print("ERROR endOfRound: Something is wrong...")
            }
        }
    }
    

    
}
