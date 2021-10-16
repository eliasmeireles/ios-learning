//
//  CalculatorView.swift
//  Calculator
//
//  Created by Elias Ferreira on 16/10/21.
//

import UIKit

protocol CalculatorDelegate {
    func onButtonTap(_ value: String?)
}

final class CalculatorView: UIView {
    
    static var sum  = "+"
    static var multiplier =  "x"
    static var divider = "÷"
    static var subtract =  "-"
    static var calculate =  "="
    static var comma =  ","
    static var percentage = "%"
    static var signalInverter = "⁺∕₋"
    static var clear = "AC"
    
    private var delegate: CalculatorDelegate
    
    private func button(name: String, color: UIColor = .lightGray) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal)
        button.autoSized()
        button.setTitle(name, for: .normal)
        button.addTarget(self, action: #selector(CalculatorView.btnClicked), for: .touchUpInside)
        return button
    }
    
    @objc func btnClicked(_ sender: UIButton) {
        delegate.onButtonTap(sender.titleLabel?.text)
    }
    
    private lazy var clearButton: UIButton = {
        return button(name: CalculatorView.clear, color: .gray)
    }()
    
    private func newLine(_ rootStack: UIStackView) -> UIStackView {
        let line = UIStackView()
        rootStack.addArrangedSubview(line)
        
        line.axis = .horizontal
        line.spacing = 1
        line.fullXAxis(view: rootStack)
        
        return line
    }
    
    private let zero: UILabel = {
        let lb = UILabel()
        lb.text = "0"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 55)
        lb.textAlignment = .right
        
        return lb
    }()
    
    func updateLabel(_ value: String) {
        zero.text = value
    }
    
    init(delegate: CalculatorDelegate) {
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        let rootStack  = UIStackView()
        rootStack.axis = .vertical
        rootStack.distribution = .fillEqually
        
        addSubview(rootStack)
        
        rootStack.fullXAxisBottom(view: self)
        let lineZero = newLine(rootStack)
        lineZero.addArrangedSubview(zero)
        
        let line = newLine(rootStack)
        rootStack.spacing = 1
        
        line.addArrangedSubview(clearButton)
        line.addArrangedSubview(button(name: CalculatorView.signalInverter, color: .gray))
        line.addArrangedSubview(button(name: CalculatorView.percentage, color: .gray))
        line.addArrangedSubview(button(name: CalculatorView.divider, color: .orange))
        
        let lineTwo = newLine(rootStack)
        
        addNumbersButton(lineTwo, 7, 9, CalculatorView.multiplier)
        
        let lineThree = newLine(rootStack)
        
        addNumbersButton(lineThree, 4, 6, CalculatorView.subtract)
        
        let lineFour = newLine(rootStack)
        
        addNumbersButton(lineFour, 1, 3, CalculatorView.sum)
    
        let lineFive = newLine(rootStack)
        
        let leftLine = UIStackView()
        lineFive.addArrangedSubview(leftLine)
        leftLine.axis = .horizontal
        leftLine.spacing = 1
        
        let zeroButton = button(name: "0")
        zeroButton.removeConstraints(zeroButton.constraints)
        leftLine.addArrangedSubview(zeroButton)
        
        let rightLine = UIStackView()
        lineFive.addArrangedSubview(rightLine)
        rightLine.axis = .horizontal
        rightLine.spacing = 1
        
        rightLine.addArrangedSubview(button(name: CalculatorView.comma))
        rightLine.addArrangedSubview(button(name: CalculatorView.calculate, color: .orange))
    }
    
    func addNumbersButton(_ stackView: UIStackView, _ start: Int, _ end: Int, _ operatorSimbol: String) {
        for i in start...end {
            stackView.addArrangedSubview(button(name: "\(i)"))
        }
        stackView.addArrangedSubview(button(name: operatorSimbol, color: .orange))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
