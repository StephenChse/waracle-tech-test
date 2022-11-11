//
//  CakeListViewModel.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation

class CakeListViewModel {
    
    enum Constant {
        static let title = "🎂CakeItApp🍰"
    }
    
    private var wsHandler: ServiceHandler
    private var coordinator: Coordinator
    var cakeList: [Cake] = []
    init(wsHandler: ServiceHandler = ServiceHandler(), coordinator: Coordinator) {
        self.wsHandler = wsHandler
        self.coordinator = coordinator
    }
    
    func fetchCakeList() async throws {
        do {
            LoadingView.show()
            let data = try await wsHandler.getCall(url: API.cakeList.url)
            cakeList = try JSONDecoder().decode([Cake].self, from: data)
            LoadingView.hide()
        } catch APIError.noData {
             // Handle Error
            LoadingView.hide()
        }
    }
    
    func cellForRowData(indexPath: IndexPath) -> CakeViewModel {
        return CakeData(cake: cakeList[indexPath.row])
    }
    
    func navigateToDetail(indexPath: IndexPath) {
        coordinator.goToCakeDetail(cakeData: CakeData(cake: cakeList[indexPath.row]))
    }
}

