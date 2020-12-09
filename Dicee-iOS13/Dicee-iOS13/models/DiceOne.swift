//
//  DiceOne.swift
//  Dicee-iOS13
//
//  Created by Elias Ferreira on 08/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

class DiceOne: Dice {
    func diceCount() -> Int {
        return 1
    }
    
    func diceImage() -> UIImage {
        return #imageLiteral(resourceName: "DiceOne")
    }
}
