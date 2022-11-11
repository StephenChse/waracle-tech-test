//
//  CakeDetailViewModekl.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation

class CakeDetailViewModel {
    private var coordinator: Coordinator
    var cakeViewModel: CakeViewModel
    
    var cakeTitle: String {
        return cakeViewModel.title
    }
    
    var cakeDesc: String {
        return cakeViewModel.desc
    }
    
    var cakeImageUrl: String {
        return cakeViewModel.image
    }
    
    init(coordinator: Coordinator, cakeViewModel: CakeViewModel) {
        self.coordinator = coordinator
        self.cakeViewModel = cakeViewModel
    }
    
    func back() {
        coordinator.back()
    }
}
