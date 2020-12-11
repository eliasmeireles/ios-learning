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
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                self.rollButton.isEnabled = false
            }
            for _ in 0...15 {
                DispatchQueue.main.async {
                    print(self.getRandomDices())
                }
                Thread.sleep(forTimeInterval: 0.0256)
            }
            DispatchQueue.main.async {
                self.roll()
                self.rollButton.isEnabled = true
            }
        }
    }
    
    
    private func getRandomDices() -> Int {
        let firstRandomDice: Dice = getRandomDice()
        firstDice.image = firstRandomDice.diceImage()
        let secondRandomDice: Dice = getRandomDice()
        secondDice.image = secondRandomDice.diceImage()
        return firstRandomDice.diceCount() + secondRandomDice.diceCount()
    }
    
    private func roll() {
        diceTotal.text = "Total: " + String(getRandomDices())
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

