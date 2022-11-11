//
//  CakeListViewModelTests.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import XCTest


final class CakeListViewModelTests: XCTestCase {
    
    var sut: CakeListViewModel!
    var coordinator: MockCoordinator!
    var mockSession: MockSession!
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockSession = MockSession()
        coordinator = MockCoordinator()
        mockSession.data = MockCakeData().getFruitDataFromFile()
        sut = CakeListViewModel(wsHandler: ServiceHandler(session: mockSession), coordinator: MockCoordinator())
    }

    override func tearDownWithError() throws {
        sut = nil
        coordinator = nil
        mockSession = nil
        try super.tearDownWithError()
    }
    
    func testFetchCakeList() async {
        try? await sut.fetchCakeList()
        XCTAssertGreaterThan(sut.cakeList.count, 5)
        
        let cakeData = sut.cellForRowData(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cakeData.title, sut.cakeList[0].title)
    }
    
    func testNavigateToDetail() {
        coordinator.goToCakeDetail(cakeData: CakeData(cake: Cake(title: "title", desc: "desc", image: "image")))
        XCTAssertTrue(coordinator.isNavigateToDetail)
    }
}
