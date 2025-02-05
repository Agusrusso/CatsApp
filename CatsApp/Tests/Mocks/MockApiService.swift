//
//  MockApiService.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import Foundation

class MockApiService {
    var mockCat: Cat?
    var shouldReturnError = false

    func fetchCats(page: Int) async throws -> [Cat] {
        return [Cat(id: "1", url: "https://example.com/cat1.jpg", breeds: [])]
    }

    func fetchCatDetails(id: String) async throws -> Cat {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 0, userInfo: nil)
        }
        return mockCat ?? Cat(id: id, url: "https://example.com/cat.jpg", breeds: [])
    }
}
