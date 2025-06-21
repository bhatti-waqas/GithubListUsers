//
//  MockNetworkService.swift
//  iOSEvaluationTests
//
//  Created by Waqas Naseem on 10/01/2024.
//

import Foundation
@testable import Networking

final class MockNetworkService: NetworkServiceProtocol {
    
    enum MockError: Error {
        case mockError
    }
    
    var result: Result<Data, Error>!
    var requestCalled: Bool = false
    
    func request<T>(with endpoint: Endpoint) async throws -> T where T: Decodable {
        requestCalled = true
        switch result {
        case .success(let data):
            guard let decodedData = try? endpoint.decoder.decode(T.self, from: data) else {
                throw MockError.mockError
            }
            return decodedData
        case .failure(let error):
            throw error
        default:
            preconditionFailure("The mock result for the function shall be populated.")
        }
    }
}
