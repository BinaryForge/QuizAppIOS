//
//  ViewController.swift
//  Quizzler
//
//  Created by Alexey Kuznetsov on 7/5/18.
//
//

import UIKit

class ViewController: UIViewController {
    
    //Instance Variables
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber: Int = 0
    var score: Int = 0;
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    //answerPressed allows to catch the user input for answer
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    //UpdateUI with current score and progress
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "Question Number: \(questionNumber + 1) /13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
    //nextQuestion seeks the next question
    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
            let alert = UIAlertController.init(title: "Done", message: "Would you like to restart?", preferredStyle: .alert)
            let restartAction = UIAlertAction.init(title: "Restart", style: .default) {
                (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    //checkAnswer gives point for valid answer
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("correct")
            score += 1
        }
        else{
            print("wrong")
        }
        
    }
    
    //startOver resets score and questionNumber
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
}
