//
//  Question.swift
//  Who_Wants_To_Be_A_Millionare
//
//  Created by Maham Shamail on 06/11/2020.
//  Copyright © 2020 Maham Shamail. All rights reserved.
//

import Foundation
struct Question {
    let question : String
    var options : [String]
    let correctAnswer : String
//    var optionsRandomised: [String]?
//    mutating func optionsInRandomOrder () -> [String] {
//       
//                var randomOptions : [String] = []
//                var safeOptionPicked: Bool = false
//                var safeOption : String
//                var i = 0
//                while !safeOptionPicked || i < 4 {
//                    safeOption = randomOptionGenerator(options: options)
//                    if(!randomOptions.contains(safeOption)){
//                        //print("safeOption: \(safeOption)")
//                        safeOptionPicked = true
//                        randomOptions.insert(safeOption, at: i)
//                        i += 1
//                    }
//                }
//                //self.options = randomOptions
//                self.optionsRandomised = randomOptions
//                return randomOptions
//            
//        }
//        func randomOptionGenerator(options:[String]) -> String {
//            let randomNumber = Int.random(in: 0...3)
//            return options[randomNumber]
//        }
        
}


