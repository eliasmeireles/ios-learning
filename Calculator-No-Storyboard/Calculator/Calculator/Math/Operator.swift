//
//  Operator.swift
//  Calculator
//
//  Created by Elias Ferreira on 16/10/21.
//

import Foundation

protocol Operator {
    
    var key: String { get }
    
    func calc(_ first: Double, _ secound: Double) -> Double
}
