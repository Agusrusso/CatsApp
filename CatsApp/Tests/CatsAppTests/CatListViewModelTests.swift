//
//  CatListViewModelTests.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import XCTest
@testable import CatsApp

class CatListViewModelTests: XCTestCase {
    var viewModel: CatListViewModel!
    var mockApiService: MockApiService!

    override func setUp() {
        super.setUp()
        mockApiService = MockApiService()
        viewModel = CatListViewModel(apiService: mockApiService)  // Inject the mock
    }

    override func tearDown() {
        viewModel = nil
        mockApiService = nil
        super.tearDown()
    }

    func testFetchCats_Success() {
        // Arrange
        let expectedCats = [
            Cat(id: "1", url: "https://example.com/cat1.jpg", breeds: []),
            Cat(id: "2", url: "https://example.com/cat2.jpg", breeds: [])
        ]
        mockApiService.mockCats = expectedCats  // Ensure mock returns these cats

        let expectation = XCTestExpectation(description: "Fetch cats success")

        // Act
        viewModel.fetchCats()

        DispatchQueue.main.async {
            // Assert
            XCTAssertEqual(self.viewModel.cats.count, 2, "Should fetch 2 cats")
            XCTAssertEqual(self.viewModel.cats.first?.id, "1", "First cat ID should match")
            XCTAssertNil(self.viewModel.errorMessage, "There should be no error message on success")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchCats_Failure() {
        // Arrange
        mockApiService.shouldReturnError = true  // Force an error

        let expectation = XCTestExpectation(description: "Fetch cats failure")

        // Act
        viewModel.fetchCats()

        DispatchQueue.main.async {
            // Assert
            XCTAssertEqual(self.viewModel.cats.count, 0, "No cats should be added on failure")
            XCTAssertNotNil(self.viewModel.errorMessage, "An error message should be set on failure")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
