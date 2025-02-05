//
//  CatsAppTests.swift
//  CatsAppTests
//
//  Created by Agustin Russo on 05/02/2025.
//

import XCTest
@testable import CatsApp

final class CatDetailViewModelTests: XCTestCase {
    var viewModel: CatDetailViewModel!
    var mockApiService: MockApiService!

    override func setUp() {
        super.setUp()
        mockApiService = MockApiService()
        viewModel = CatDetailViewModel()
    }

    override func tearDown() {
        viewModel = nil
        mockApiService = nil
        super.tearDown()
    }

    func testFetchCatDetails_Success() async {
        // Given
        let expectedCat = Cat(id: "abc123", url: "https://example.com/cat.jpg", breeds: [])
        mockApiService.mockCat = expectedCat

        // When
        await viewModel.fetchCatDetails(id: "abc123")

        // Then
        XCTAssertNotNil(viewModel.cat, "Cat object should not be nil after fetching details")
        XCTAssertEqual(viewModel.cat?.id, "abc123", "The fetched cat ID should match")
    }

    func testFetchCatDetails_Failure() async {
        // Given
        mockApiService.shouldReturnError = true

        // When
        await viewModel.fetchCatDetails(id: "xyz456")

        // Then
        XCTAssertNil(viewModel.cat, "Cat should be nil when fetch fails")
        XCTAssertNotNil(viewModel.errorMessage, "Error message should be set on failure")
    }
}
