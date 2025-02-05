//
//  CatsAppUITests.swift
//  CatsAppUITests
//
//  Created by Agustin Russo on 05/02/2025.
//

import XCTest

final class CatDetailUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testDetailViewDisplaysCatInfo() throws {
        // Navigate to detail view first
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "First cat cell should be visible")
        firstCell.tap()

        // Ensure image and text exist
        let detailImage = app.images["catDetailImage"]
        XCTAssertTrue(detailImage.waitForExistence(timeout: 5), "Detail image should be visible")

        let breedText = app.staticTexts["breedInfo"]
        XCTAssertTrue(breedText.waitForExistence(timeout: 5), "Breed info should be visible")
    }
}
