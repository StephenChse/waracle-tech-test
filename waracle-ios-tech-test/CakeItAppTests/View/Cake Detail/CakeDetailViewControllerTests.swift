//
//  CakeDetailViewControllerTests.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import XCTest

final class CakeDetailViewControllerTests: XCTestCase {
    
    var sut: CakeDetailViewController!
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Self.classForCoder()))
        let cake = CakeData(cake: Cake(title: "testTitle", desc: "testDesc", image: "testImage"))
        sut = storyboard.instantiateViewController(withIdentifier: "CakeDetailViewController") as? CakeDetailViewController
        sut.viewModel = CakeDetailViewModel(coordinator: MockCoordinator(), cakeViewModel: cake)
        XCTAssertNotNil(sut.viewDidLoad())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testSetData() {
       XCTAssertNotNil(sut.setData())
    }
}
