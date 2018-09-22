//
//  MoreVC.swift
//  Introduction-to-iOS
//
//  Created by Ivan OSYPENKO on 9/22/18.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var rightAnswers : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    
    func nextQuestion() {
        if questionNumber <= 4 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            var alert = UIAlertController(title: "Носорожки огорчены", message: "Начать заново?", preferredStyle: .alert)
            if rightAnswers == 5 {
                alert = UIAlertController(title: "Носорожки гордятся тобой", message: "Начать заново?", preferredStyle: .alert)
            }
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlerAction) in self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if (pickedAnswer == correctAnswer) {
            rightAnswers += 1
            progressLabel.text = "\(rightAnswers)/5"
        } else {
            print("Wrong")
        }
        questionNumber += 1
    }
    
    func startOver() {
        questionNumber = 0
        rightAnswers = 0
        progressLabel.text = "\(rightAnswers)/5"
        nextQuestion()
    }
    
    
}

