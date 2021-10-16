//
//  RootViewController.swift
//  Test
//
//  Created by Elias Ferreira on 10/10/21.
//

import UIKit

func setDefaultViewController(safeWindow: UIWindow) {
    safeWindow.frame = UIScreen.main.bounds
    safeWindow.rootViewController = ViewController()
    safeWindow.makeKeyAndVisible()
}
