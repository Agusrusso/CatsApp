//
//  MockApiService.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import Foundation
@testable import CatsApp

class MockApiService: ApiServiceProtocol {
    var mockCats: [Cat] = []
    var shouldReturnError = false

    func fetchCats(page: Int, limit: Int, completion: @escaping (Result<[Cat], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "TestError", code: 0, userInfo: nil)))
        } else {
            completion(.success(mockCats))
        }
    }

    func fetchCatDetails(id: String, completion: @escaping (Result<Cat, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "TestError", code: 0, userInfo: nil)))
        } else if let cat = mockCats.first(where: { $0.id == id }) {
            completion(.success(cat))
        } else {
            completion(.failure(NSError(domain: "NotFound", code: 404, userInfo: nil)))
        }
    }
}
