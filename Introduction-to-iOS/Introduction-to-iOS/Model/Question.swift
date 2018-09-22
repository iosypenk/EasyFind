//
//  Question.swift
//  Introduction-to-iOS
//
//  Created by Maxym RYBAK on 22.09.2018.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
