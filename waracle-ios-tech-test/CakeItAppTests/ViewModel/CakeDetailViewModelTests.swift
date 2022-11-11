//
//  CakeDetailViewModelTests.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import XCTest

final class CakeDetailViewModelTests: XCTestCase {
    
    var sut: CakeDetailViewModel!
    var mockCoordinator: MockCoordinator!
    var cakeViewModel: CakeViewModel!
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCoordinator = MockCoordinator()
        cakeViewModel = CakeData(cake: Cake(title: "testTitle", desc: "testDesc", image: "testImage"))
        sut = CakeDetailViewModel(coordinator: mockCoordinator, cakeViewModel: cakeViewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockCoordinator = nil
        cakeViewModel = nil
        try super.tearDownWithError()
    }
    
    func testCheckData() {
        XCTAssertEqual(cakeViewModel.title, sut.cakeTitle)
        XCTAssertEqual(cakeViewModel.image, sut.cakeImageUrl)
        XCTAssertEqual(cakeViewModel.desc, sut.cakeDesc)
    }
}
    
