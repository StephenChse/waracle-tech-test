//
//  MockServiceHandker.swift
//  CakeItAppTests
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation

class MockSession: NetworkSession {
    var data: Data?
    func getCall(url: URL) async throws -> Data {
        if let data = data {
            return data
        }
        throw APIError.noData
    }
}
