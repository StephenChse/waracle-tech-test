//
//  ServiceHandler.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation

enum API: String {
    private static let baseURL = "https://\(Bundle.main.object(forInfoDictionaryKey: "BASE_URL") ?? "")"
    case cakeList = "cakeList"
    var url: URL {
        return URL(string: API.baseURL + self.rawValue)!
    }
}

enum APIError: Error {
    case noData
    case error(Error)
}

protocol NetworkSession {
    func getCall(url: URL) async throws -> Data
}

extension URLSession: NetworkSession {
    func getCall(url: URL) async throws -> Data {
        do  {
            let (data, _) = try await data(from: url)
            return data
        } catch {
            throw APIError.noData
        }
    }
}

class ServiceHandler {
    private let session: NetworkSession
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func getCall(url: URL) async throws -> Data {
        return try await session.getCall(url: url)
    }
}
