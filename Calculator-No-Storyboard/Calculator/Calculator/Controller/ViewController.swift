//
//  ViewController.swift
//  Calculator
//
//  Created by Elias Ferreira on 10/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculatorView: CalculatorView? = nil
    private let operators: Array<Operator> = [Multiplier(), Sum(), Subtract(), Divider()]
    
    private var mathOperator: Operator? = nil
    private var firstValue: String = ""
    private var secondValue: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    func buildView() {
        view = CalculatorView(delegate: self)
        
        calculatorView = view as? CalculatorView
    }
    
    func updateResultLabel(value: String) {
        let asDouble = (Double(value) ?? nil)
        if let doubleValue = asDouble {
            calculatorView?.updateLabel(self.stringNumericValidation(value: doubleValue))
        } else {
            calculatorView?.updateLabel(replaceDotWithComma(value))
        }
    }
    
    func updateResultLabel(value: Double) {
        self.updateResultLabel(value: "\(value)")
    }
    
    fileprivate func replaceDotWithComma(_ value: String) -> String {
        return value.replacingOccurrences(of: ".", with: CalculatorView.comma)
    }
}

extension ViewController: CalculatorDelegate {
    
    func onButtonTap(_ value: String?) {
        if let inputedValued = value {
            handler(value: inputedValued)
        }
    }
}

extension ViewController {
    fileprivate func handler(value: String) {
        if let mathOperator = findOperator(value) {
            self.mathOperator = mathOperator
            self.secondValue = ""
        } else if let inputValue =  handlerInputValue(value: value) {
            self.updateResultLabel(value: inputValue)
        } else {
            handlerOperation(value: value)
        }
    }

    
    fileprivate func handlerOperation(value: String) {
        switch value {
        case CalculatorView.clear:
            self.clearInputValues()
        case CalculatorView.calculate:
            self.calculate()
        case CalculatorView.percentage:
            self.percentage()
        case CalculatorView.signalInverter:
            self.signalInverter()
        default:
            print("Operation not implemented.")
        }
    }
    
    fileprivate func signalInverter() {
        let first: Double? = self.replaceCommaWithDot(firstValue)
        let second: Double? = self.replaceCommaWithDot(secondValue)
        
        if let firstValue = first {
            let value = second ?? firstValue
            
            self.secondValue = self.stringNumericValidation(value: (value) * -1)
            self.updateResultLabel(value: "\(self.secondValue)")
        }
    }
    
    fileprivate func percentage() {
        if(self.percentageValidation(self.firstValue)) {
            self.secondValue = "100"
            self.mathOperator = Divider()
            self.calculate()
        }
    }
    
    fileprivate func percentageValidation(_ value: String) -> Bool {
        return value != "0" && !value.isEmpty
    }
    
    fileprivate func replaceCommaWithDot(_ value: String) -> Double? {
        return Double(value.replacingOccurrences(of: CalculatorView.comma, with: "."))
    }
    
    fileprivate func calculate() {
        let first: Double? = replaceCommaWithDot(firstValue)
        
        if(secondValue.isEmpty) {
            secondValue = firstValue
        }
        
        let second: Double = replaceCommaWithDot(secondValue) ?? 0
        
        if let mathOperator = self.mathOperator {
            if let firstValue = first {
                let result = mathOperator.calc(firstValue, second)
                self.firstValue = self.stringNumericValidation(value: result)
                self.updateResultLabel(value: self.firstValue)
            }
        }
    }
    
    fileprivate func clearInputValues() {
        self.calculatorView?.updateLabel("0")
        self.mathOperator = nil
        self.firstValue = ""
        self.secondValue = ""
    }
    
    fileprivate func mountStringNumber(_ number: Int) -> String {
        if self.mathOperator != nil {
            self.secondValue = "\(self.secondValue)\(number)"
            return self.secondValue
        }
        
        firstValue = "\(firstValue)\(number)"
        return firstValue
    }
    
    fileprivate func mountStringNumberComa(_ comma: String) -> String {
        if mathOperator != nil {
            secondValue = appendComma(secondValue)
            return secondValue
        }
        
        firstValue = appendComma(firstValue)
        return self.firstValue
    }
    
    fileprivate func appendComma(_ value: String) -> String {
        if(!value.contains(CalculatorView.comma)) {
            return value + CalculatorView.comma
        }
        return value
    }
    
    fileprivate func handlerInputValue(value: String) -> String? {
        if let number = Int(value) ?? nil {
            return mountStringNumber(number)
        } else if(value == CalculatorView.comma) {
            return mountStringNumberComa(value)
        }
        return nil
    }
    
    fileprivate func findOperator(_ value: String) -> Operator? {
        for mathOperator in operators {
            if(mathOperator.key == value) {
                return mathOperator
            }
        }
        return nil
    }
}

extension ViewController {
    
    fileprivate func stringNumericValidation(value: Double) -> String {
        if(floor(value) == value) {
            return "\(Int(value))"
        }
        return "\(value)"
    }
}

