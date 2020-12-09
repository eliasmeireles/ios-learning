//
//  DiceFor.swift
//  Dicee-iOS13
//
//  Created by Elias Ferreira on 08/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

class DiceFor: Dice {
    
    func diceCount() -> Int {
        return 4
    }
    
    func diceImage() -> UIImage {
        return #imageLiteral(resourceName: "DiceFour")
    }
}
