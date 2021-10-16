//
//  Clear.swift
//  Calculator
//
//  Created by Elias Ferreira on 16/10/21.
//

import Foundation

final class Clear: Operator {
   
    var key: String = CalculatorView.clear
    
    func calc(_ first: Double, _ secound: Double) -> Double {
        return 0
    }
}
