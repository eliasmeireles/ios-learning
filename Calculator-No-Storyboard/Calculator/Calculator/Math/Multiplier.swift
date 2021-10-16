//
//  Multiplier.swift
//  Calculator
//
//  Created by Elias Ferreira on 16/10/21.
//

import Foundation

final class Multiplier: Operator {
    
    var key: String = CalculatorView.multiplier
    
    func calc(_ first: Double, _ secound: Double) -> Double {
        return first * secound
    }
}
