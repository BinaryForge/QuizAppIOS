//
//  question.swift
//  Quizzler
//
//  Created by Alexey Kuznetsov on 6/21/18.
//  
//

import Foundation
class Question {
    //Properties
    let questionText: String
    let answer: Bool
    
    //Initialization
    init(text:String,correctAnswer:Bool) {
        questionText = text
        answer = correctAnswer
    }
}


