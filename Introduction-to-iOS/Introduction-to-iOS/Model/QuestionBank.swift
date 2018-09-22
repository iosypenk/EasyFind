//
//  QuestionBank.swift
//  Introduction-to-iOS
//
//  Created by Maxym RYBAK on 22.09.2018.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
        // Creating a quiz item and appending it to the list
        let item = Question(text: "Самый крупный известный рог носорога имел длину 158 сантиметров?", correctAnswer: true)
        
        // Add the Question to the list of questions
        list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "У носорога 3 пальца", correctAnswer: true))
        list.append(Question(text: "В Африке водятся черные носороги", correctAnswer: true))
        list.append(Question(text: "Черные носороги в америке имеют такиеже права как и белые", correctAnswer: false))
        list.append(Question(text: "Разогнавшись, носорог может достичь скорости 45 км/ч.", correctAnswer: true))
    }
}
