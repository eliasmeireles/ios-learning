//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Elias Ferreira on 14/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.choices = a
        self.correctAnswer = correctAnswer
    }
}
