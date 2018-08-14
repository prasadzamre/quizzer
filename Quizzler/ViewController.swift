//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allquestion = QuestionBank()
    var pickAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let firstQuestion = allquestion.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickAnswer = true
        }
        else  if sender.tag == 2 {
            pickAnswer = false
  
    }
        checkAnswer()
        questionNumber = questionNumber + 1
       
        nextQuestion()
        
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "score:- \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allquestion.list[questionNumber].questionText
            
            updateUI()
        }
        else{
           
            let alert = UIAlertController(title: "Awesome", message: "you have finish all question willl you like to start over", preferredStyle: .alert)
            
            let restarAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restarAction)
            present(alert,animated: true,completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allquestion.list[questionNumber].answer
        
        if correctAnswer == pickAnswer{
           ProgressHUD.showSuccess("Correct")
            
            score += 1
        }
        else{
           ProgressHUD.showError("Wrong !")
            
        }
    }
    
    
    func startOver() {
      questionNumber = 0
        nextQuestion()
       score = 0
        
        updateUI()
    }
    
 
    
}
