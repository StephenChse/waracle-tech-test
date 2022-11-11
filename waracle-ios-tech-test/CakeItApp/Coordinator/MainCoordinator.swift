//
//  MainCoordinator.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigation: UINavigationController

    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let view: CakeListViewController = UIStoryboard.main.initiate()
        view.viewModel = CakeListViewModel(coordinator: self)
        navigation.pushViewController(view, animated: true)
    }
    
    func goToCakeDetail(cakeData: CakeViewModel) {
        let view: CakeDetailViewController = UIStoryboard.main.initiate()
        view.viewModel = CakeDetailViewModel(coordinator: self, cakeViewModel: cakeData)
        navigation.pushViewController(view, animated: true)
    }
    
    func back() {
        navigation.popViewController(animated: true)
    }
}
