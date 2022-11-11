//
//  MockCakeData.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation

class MockCakeData {
    func getFruitDataFromFile() -> Data {
        return dataFromJSON(withName: "Cake")!
    }
}

func dataFromJSON(withName name: String) -> Data? {
    guard let fileURL = Bundle(for: CakeItAppTests.self).url(forResource: name, withExtension: "json") else {
        return nil
    }
    return try? Data(contentsOf: fileURL)
}
