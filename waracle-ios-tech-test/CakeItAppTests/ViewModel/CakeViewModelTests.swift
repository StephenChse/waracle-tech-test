//
//  CakeViewModelTest.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import XCTest

final class CakeViewModelTests: XCTestCase {

    var sut: CakeData!
    let cake = Cake(title: "testCake", desc: "testDesc", image: "testImage")
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CakeData(cake: cake)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCakeData() {
        XCTAssertEqual(sut.title, "testCake")
        XCTAssertEqual(sut.desc, "testDesc")
        XCTAssertEqual(sut.image, "testImage")
        
        sut = CakeData(cake: Cake(title: nil, desc: nil, image: nil))
        XCTAssertEqual(sut.title, "")
        XCTAssertEqual(sut.desc, "")
        XCTAssertEqual(sut.image, "")
    }
        
}
