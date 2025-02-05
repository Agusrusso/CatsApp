//
//  ItemListUITests.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import XCTest
import SnapshotTesting

final class CatListUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testCatListSnapshot() throws {
        let catList = app.scrollViews.firstMatch
        XCTAssertTrue(catList.waitForExistence(timeout: 5), "Cat list should be visible")

        // Take a screenshot and compare it
        let screenshot = XCUIScreen.main.screenshot().image
        assertSnapshot(matching: screenshot, as: .image)
    }
}
