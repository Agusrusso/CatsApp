//
//  MockApiService.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import Foundation

class MockApiService {
    var shouldReturnError = false
    var mockCat: Cat?

    func fetchCats(page: Int, limit: Int) async throws -> [Cat] {
        return []
    }

    func fetchCatDetails(id: String) async throws -> Cat {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 500, userInfo: nil)
        }
        return mockCat ?? Cat(id: id, url: "https://example.com/cat.jpg", breeds: [])
    }
}
