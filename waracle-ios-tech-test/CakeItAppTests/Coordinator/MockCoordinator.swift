//
//  MockCoordinator.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation
import UIKit

@testable import CakeItApp

class MockCoordinator: Coordinator {
    var navigation: UINavigationController
    
    init(navigation: UINavigationController = UINavigationController()) {
        self.navigation = navigation
    }
    
    var isStart = false
    var isBack = false
    var isNavigateToDetail = false
    
    func start() {
        isStart = true
    }
    
    func goToCakeDetail(cakeData: CakeViewModel) {
        isNavigateToDetail = true
    }
    
    func back() {
        isBack = true
    }
}

