//
//  CakeListViewControllerTests.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import XCTest

final class CakeListViewControllerTests: XCTestCase {

    var sut: CakeListViewController!
    var mockSession: MockSession!
    var coordinator: MockCoordinator!
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockSession = MockSession()
        mockSession.data = MockCakeData().getFruitDataFromFile()
        let serviceHandler = ServiceHandler(session: mockSession)

        coordinator = MockCoordinator()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Self.classForCoder()))
        sut = storyboard.instantiateViewController(withIdentifier: "CakeListViewController") as? CakeListViewController
        sut.viewModel = CakeListViewModel(wsHandler: serviceHandler, coordinator: coordinator)
    }

    func testViewDidLoad() {
        XCTAssertNotNil(sut.viewDidLoad())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
}
