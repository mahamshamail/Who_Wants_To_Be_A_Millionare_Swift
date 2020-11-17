//
//  QuestionBank.swift
//  Who_Wants_To_Be_A_Millionare
//
//  Created by Maham Shamail on 06/11/2020.
//  Copyright © 2020 Maham Shamail. All rights reserved.
//

import Foundation
class QuestionBank {
    var questionBeingAsked: Question?
    var allQuestions: [Question] {
        get{
            let question1 = Question(question: "What is Harry Potter’s patronus?",options: ["A horse","An otter","A hare","A stag"],correctAnswer: "A stag")
            let question2 = Question(question: "What does Dumbledore give to Ron in his will?",options: ["Deluminator","Invisibility cloak","Portrait","Wand"],correctAnswer: "Deluminator")
            let question3 = Question(question: "Who was the Hogwarts headmaster right before Dumbledore?",options: ["Phineas Nigellus","Armando Dippet","Dolores Umbridge","Dexter Fortescue"],correctAnswer: "Armando Dippet")
            let question4 = Question(question: "What is the highest-grossing film of all time without taking inflation into account?",options: ["Titanic","Avengers: Endgame","Avatar","Star Wars: The Force Awakens"],correctAnswer: "Avengers: Endgame")
            let question5 = Question(question: "Which film did Steven Spielberg win his first Oscar for Best Director?",options: ["Jaws","Catch Me If You Can","E.T.","Schindler’s List"],correctAnswer: "Schindler’s List")
            let question6 = Question(question: "Which film won the first Academy Award for Best Picture?",options: ["All Quiet on the Western Front","Sunrise","Wings","Metropolis"],correctAnswer: "Wings")
            let question7 = Question(question: "What does “Valar Morghulis” mean in High Valyrian?",options: ["All men must die","All men must bow","All men must kill","All men must live"],correctAnswer: "All men must die")
            let question8 = Question(question: "What was the name of The Spice Girls’ debut album in 1996?",options: ["Forever","Spiceworld","Spice","Wannabe"],correctAnswer: "Spice")
            let question9 = Question(question: "How many black keys are found on a traditional piano?",options: ["32","34","52","54"],correctAnswer: "32")
            let question10 = Question(question: "What Nashville venue was Taylor Swift playing at when she was discovered?",options: ["Mercy Lounge","The Bluebird Cafe","The Basement East","12 & Porter"],correctAnswer: "The Bluebird Cafe")
            let question11 = Question(question: "In the TV show Game of Thrones what is the language of the White Walkers?",options: ["Valyrian","Dothraki","Skroth","Asshai’i"],correctAnswer: "Skroth")
            let question12 = Question(question: "In Game of Thrones what are the three names of Daenerys’ dragons?",options: ["Dragon, Vision, and Regal","Drogon, Viscer, an Rhegela","Drogon, Viserion, and Rhaegal","Drogon, Viserion, and Rheagala"],correctAnswer: "Drogon, Viserion, and Rhaegal")
            let question13 = Question(question: "In Harry Potter and The Goblet of FIre who dies during the third Tri-wizard Tournament? ",options: ["Viktor Krum","Cedric Diggory","Fleur Delacour","Cormac McLaggen"],correctAnswer: "Cedric Diggory")
            let question14 = Question(question: "In Harry Potter what does the Imperius Curse do? ",options: ["Mimics","Controls","Kills","Tortures"],correctAnswer: "Controls")
            let question15 = Question(question: "Which actor or actress is killed off in the opening scene of the movie Scream?",options: ["Courtney Cox","Neve Campbell","Drew Barrymore","Rose McGowan"],correctAnswer: "Drew Barrymore")
            let question16 = Question(question: "What is Fergie’s real name?",options: ["Stacey Ferguson","Stacie Ann Ferguson","Stacey Ann Fergusen","Stacie Ann Fergusen"],correctAnswer: "Stacie Ann Ferguson")
            return [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13,  question14, question15, question16   ]
        }
    }
    var askedQuestions: [String] = []
//    var allQuests: Set<Question>
    
    init(){
        
    }

    func randomQuestionGenerator(questions:[Question]) -> Question {
        if questions.count < 15 {
            print("ERROR: Cannot load game fully. Populate database of question!")
            let randomNumber = Int.random(in: 0...allQuestions.count-1)
            return questions[randomNumber]
        } else {
            let randomNumber = Int.random(in: 0...allQuestions.count-1)
            return questions[randomNumber]
        }
        
    }
    func generateRandomQuestionToAsk() -> Question {
        var safeOption : Question = Question(question: "Question_NOT_SET_YET", options: ["String_1","String_2","String_3","String_4"], correctAnswer: "Ans_NOT_SET_YET")
        var safeOptionPicked: Bool = false
        var i = 0
        while !safeOptionPicked {
            safeOption = randomQuestionGenerator(questions: allQuestions)
            if(!askedQuestions.contains(safeOption.question)){
                //print("safeOption: \(safeOption)")
                safeOptionPicked = true
                i += 1
                }
            }
            askedQuestions.append(safeOption.question)
            questionBeingAsked = safeOption
            return safeOption
    }
        
        
}
    

