//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var soundUtil: SoundUtil = SoundUtil()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        if let sound: String = sender.titleLabel?.text {
            soundUtil.playSound(soundResource: sound)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {            
            sender.alpha = 1.0
        }
    }
}

