//
//  DiceTwo.swift
//  Dicee-iOS13
//
//  Created by Elias Ferreira on 08/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

class DiceTwo: Dice {
    func diceCount() -> Int {
        return 2
    }
    
    func diceImage() -> UIImage {
        return #imageLiteral(resourceName: "DiceTwo")
    }
}
