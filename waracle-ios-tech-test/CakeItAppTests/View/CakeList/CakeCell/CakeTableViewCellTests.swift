//
//  CakeTableViewCellTests.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import XCTest

final class CakeTableViewCellTests: XCTestCase {

    var sut: CakeTableViewCell!
    override func setUpWithError() throws {
        try super.setUpWithError()
     
        let bundle = Bundle(for: type(of: self))
        guard let cell = bundle.loadNibNamed("\(CakeTableViewCell.self)", owner: nil)?.first as? CakeTableViewCell else {
            XCTFail("Unable to create cell")
            return
        }
        sut = cell
    }

    func testSetData() {
        let cakeviewModel = CakeData(cake: Cake(title: "testTitle", desc: "testDesc", image: "https://img.delicious.com.au/xRc0uydo/del/2015/10/dundee-cake-10249-1.jpg"))
        sut.setData(cakeViewModel: cakeviewModel)
        XCTAssertEqual(sut.titleLabel?.text, "testTitle")
    }
    
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}
