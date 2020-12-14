//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var soundUtil = SoundUtil()
    
    let SOFT = "Soft"
    let MEDIUM = "Medium"
    let HARD = "Hard"
    
    let soft = 5
    let medium = 8
    let hard = 12
    
    let eggTimes: Dictionary<String, Int> = ["Soft": 3, "Medium": 5, "Hard": 8]
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTIme = 0
    var secondsPassed = 0

    
    @IBAction func prepearEgge(_ sender: UIButton) {
        if let hardness = sender.titleLabel?.text {
            //            switch hardness {
            //            case SOFT:
            //                print(soft)
            //            case MEDIUM:
            //                print(medium)
            //            default:
            //                print(hard)
            //            }
            
            if let value: Int = eggTimes[hardness] {
                totalTIme = value
                secondsPassed = 0
                timer.invalidate()
                progressBar.progress = 0.0
                progressBar.alpha = 1
               timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        }
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTIme {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTIme)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            progressBar.alpha = 0
            soundUtil.playSound(soundResource: "alarm_sound")
        }
    }
}
