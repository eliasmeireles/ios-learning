//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var labelScore: UILabel!
    
    
    let quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswser  = quizBrain.checkAnswer(sender.titleLabel?.text)
        
        sender.backgroundColor = userAnswser ? UIColor.green :UIColor.red
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
    }
    
    @objc  func updateUi() {
        questionLabel.text = quizBrain.getQuestionText()
        labelScore.text = "Score: \(quizBrain.getScore())"
        let choices: [String] = quizBrain.getQuestionChoices()
        firstChoiceButton.setTitle(choices[0], for: .normal)
        secondChoiceButton.setTitle(choices[1], for: .normal)
        thirdChoiceButton.setTitle(choices[2], for: .normal)
        
        firstChoiceButton.backgroundColor = UIColor.clear
        secondChoiceButton.backgroundColor = UIColor.clear
        thirdChoiceButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
}
