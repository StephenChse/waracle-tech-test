//
//  BaseController.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation
import UIKit


protocol ControllerTitle {
    func setTitle(title: String)
}

extension ControllerTitle where Self: UIViewController {
    func setTitle(title: String) {
        self.title = title
    }
}
