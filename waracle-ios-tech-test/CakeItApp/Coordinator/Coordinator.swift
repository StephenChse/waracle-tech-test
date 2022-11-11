//
//  Coordinator.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation
import UIKit
protocol Coordinator {
    var navigation: UINavigationController { get set }
    func start()
    func goToCakeDetail(cakeData: CakeViewModel)
    func back()
}
