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
        viewModel.fetchCatDetails(id: "abc123")

        // Then
        XCTAssertEqual(viewModel.cat?.id, expectedCat.id, "The fetched cat ID should match")
        XCTAssertEqual(viewModel.cat?.url, expectedCat.url, "The fetched cat URL should match")
        XCTAssertFalse(viewModel.isLoading, "Loading state should be false after completion")
    }

    func testFetchCatDetails_Failure() async {
        // Given
        mockApiService.shouldReturnError = true

        // When
        viewModel.fetchCatDetails(id: "invalid_id")

        // Then
        XCTAssertNil(viewModel.cat, "Cat should be nil on failure")
        XCTAssertNotNil(viewModel.errorMessage, "Error message should be set on failure")
        XCTAssertFalse(viewModel.isLoading, "Loading state should be false after completion")
    }
}
