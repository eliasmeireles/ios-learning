//
//  ConstraintsConfig.swift
//  Calculator
//
//  Created by Elias Ferreira on 10/10/21.
//

import UIKit

//MARK: - Enabling constraints

extension Array where Element: NSLayoutConstraint {
    func enable() {
        forEach {(item) in
            item.isActive = true
        }
    }
}

extension UIView {
    
    func fullYAxis(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            topAnchor.constraint(equalTo: view.topAnchor)
        ].enable()
    }
    
    func fullXAxis(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].enable()
    }
    
    func fullXAxisBottom(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].enable()
    }
    
    func fullXYAxis(view: UIView) {
        fullXAxis(view: view)
        fullYAxis(view: view)
    }
    
    func autoSized(multiplier: CGFloat = 1 / 1, constant: CGFloat = 0.0 ) {
        addConstraint(NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: multiplier,
            constant: constant))
    }
}


