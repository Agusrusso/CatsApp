//
//  CatListViewModelTests.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import XCTest
@testable import CatApp

final class CatListViewModelTests: XCTestCase {
    var viewModel: CatListViewModel!
    var mockApiService: MockApiService!

    override func setUp() {
        super.setUp()
        mockApiService = MockApiService()
        viewModel = CatListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        mockApiService = nil
        super.tearDown()
    }

    func testFetchCats_Success() async {
        // Given
        let mockCats = [
            Cat(id: "1", url: "https://example.com/cat1.jpg", breeds: []),
            Cat(id: "2", url: "https://example.com/cat2.jpg", breeds: [])
        ]
        mockApiService.mockCat = mockCats.first

        // When
        await viewModel.fetchCats()

        // Then
        XCTAssertEqual(viewModel.cats.count, 1, "Cats list should contain 1 item")
        XCTAssertEqual(viewModel.cats.first?.id, "1", "First cat ID should match")
        XCTAssertFalse(viewModel.isLoading, "Loading state should be false after completion")
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil on success")
    }

    func testFetchCats_Failure() async {
        // Given
        mockApiService.shouldReturnError = true

        // When
        await viewModel.fetchCats()

        // Then
        XCTAssertTrue(viewModel.cats.isEmpty, "Cats list should be empty on failure")
        XCTAssertNotNil(viewModel.errorMessage, "Error message should be set on failure")
        XCTAssertFalse(viewModel.isLoading, "Loading state should be false after failure")
    }

    func testPagination_FetchMoreCats() async {
        // Given
        let mockCats = [
            Cat(id: "1", url: "https://example.com/cat1.jpg", breeds: []),
            Cat(id: "2", url: "https://example.com/cat2.jpg", breeds: [])
        ]
        
        // Simulate multiple fetch calls for pagination
        await viewModel.fetchCats()
        await viewModel.fetchCats()

        // Then
        XCTAssertGreaterThanOrEqual(viewModel.page, 2, "Page number should increment after multiple fetch calls")
    }
}
