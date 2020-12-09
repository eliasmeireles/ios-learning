//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dices = [Dice]()
    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var diceTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDices()
        roll()
    }
    
    @IBAction func rerollDice(_ sender: UIButton) {
        roll()
    }
    
    fileprivate func roll() {
        let firstRandomDice: Dice = getRandomDice()
        firstDice.image = firstRandomDice.diceImage()
        let secondRandomDice: Dice = getRandomDice()
        secondDice.image = secondRandomDice.diceImage()
        let totalString: String = String(firstRandomDice.diceCount() + secondRandomDice.diceCount())
        diceTotal.text = "Total: " + totalString
    }
    
    func loadDices() {
        dices.append(DiceOne())
        dices.append(DiceTwo())
        dices.append(DiceThree())
        dices.append(DiceFor())
        dices.append(DiceFive())
        dices.append(DiceSixe())
    }
    
    func getRandomDice() -> Dice {
        let randomIndex = Int.random(in: 0..<dices.count)
        return dices[randomIndex]
    }
}

