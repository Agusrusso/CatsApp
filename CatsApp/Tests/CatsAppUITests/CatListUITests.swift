//
//  ItemListUITests.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import XCTest

final class CatListUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testCatListDisplaysItems() throws {
        // Ensure list exists
        let catList = app.scrollViews.firstMatch
        XCTAssertTrue(catList.waitForExistence(timeout: 5), "Cat list should be visible")

        // Check if at least one cell is visible
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "At least one cat should be visible")
    }

    func testNavigateToDetailView() throws {
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "First cat cell should be visible")

        // Tap the first item
        firstCell.tap()

        // Verify detail screen appears
        let detailImage = app.images["catDetailImage"]
        XCTAssertTrue(detailImage.waitForExistence(timeout: 5), "Detail image should be visible")
    }
}
