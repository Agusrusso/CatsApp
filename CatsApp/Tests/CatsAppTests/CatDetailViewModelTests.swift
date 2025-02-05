//
//  CatsAppTests.swift
//  CatsAppTests
//
//  Created by Agustin Russo on 05/02/2025.
//

import XCTest
@testable import CatsApp

class CatDetailViewModelTests: XCTestCase {
    var viewModel: CatDetailViewModel!
    var mockApiService: MockApiService!

    override func setUp() {
        super.setUp()
        mockApiService = MockApiService()
        viewModel = CatDetailViewModel(apiService: mockApiService)  // Inject the mock
    }

    override func tearDown() {
        viewModel = nil
        mockApiService = nil
        super.tearDown()
    }

    func testFetchCatDetails_Success() {
        // Arrange
        let expectedCat = Cat(id: "abc123", url: "https://example.com/cat.jpg", breeds: [])
        mockApiService.mockCats = [expectedCat]  // Ensure mock returns this

        let expectation = XCTestExpectation(description: "Fetch cat details success")

        // Act
        viewModel.fetchCatDetails(id: "abc123")

        DispatchQueue.main.async {
            // Assert
            XCTAssertNotNil(self.viewModel.cat, "The cat should not be nil after a successful fetch")
            XCTAssertEqual(self.viewModel.cat?.id, "abc123", "The fetched cat ID should match")
            XCTAssertNil(self.viewModel.errorMessage, "There should be no error message on success")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchCatDetails_Failure() {
        // Arrange
        mockApiService.shouldReturnError = true  // Force an error

        let expectation = XCTestExpectation(description: "Fetch cat details failure")

        // Act
        viewModel.fetchCatDetails(id: "invalid_id")

        DispatchQueue.main.async {
            // Assert
            XCTAssertNil(self.viewModel.cat, "Cat should be nil on failure")
            XCTAssertNotNil(self.viewModel.errorMessage, "An error message should be set on failure")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
