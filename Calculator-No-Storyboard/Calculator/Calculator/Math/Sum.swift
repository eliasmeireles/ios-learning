//
//  Sum.swift
//  Calculator
//
//  Created by Elias Ferreira on 16/10/21.
//

import Foundation


final class Sum: Operator {
   
    var key: String = CalculatorView.sum
    
    func calc(_ first: Double, _ secound: Double) -> Double {
        return first + secound
    }
}
