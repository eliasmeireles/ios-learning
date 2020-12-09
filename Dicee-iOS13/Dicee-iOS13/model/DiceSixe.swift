//
//  DiceSixe.swift
//  Dicee-iOS13
//
//  Created by Elias Ferreira on 08/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

class DiceSixe: Dice {
    func diceCount() -> Int {
        return 6
    }
    
    func diceImage() -> UIImage {
        return #imageLiteral(resourceName: "DiceSix")
    }
}
