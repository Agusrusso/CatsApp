//
//  CatsAppUITests.swift
//  CatsAppUITests
//
//  Created by Agustin Russo on 05/02/2025.
//

import XCTest
import SnapshotTesting

final class CatDetailUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testCatDetailSnapshot() throws {
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "First cat cell should be visible")
        firstCell.tap()

        // Take a screenshot and compare it
        let screenshot = XCUIScreen.main.screenshot().image
        assertSnapshot(matching: screenshot, as: .image)
    }
}

