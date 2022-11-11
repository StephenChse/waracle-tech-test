//
//  CakeViewModel.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation

protocol CakeViewModel {
    init(cake: Cake)
    var title: String {get}
    var desc: String {get}
    var image: String {get}
}

class CakeData: CakeViewModel {
    private var cake: Cake
    required init(cake: Cake) {
        self.cake = cake
    }
    
    var title: String {
        return cake.title ?? ""
    }
    
    var desc: String {
        return cake.desc ?? ""
    }
    
    var image: String {
        return cake.image ?? ""
    }
}
