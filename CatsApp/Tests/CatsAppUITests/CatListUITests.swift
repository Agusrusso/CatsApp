//
//  ItemListUITests.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import XCTest

class CatListUITests: XCTestCase {
    func testListViewLoads() {
        let app = XCUIApplication()
        app.launch()
        
        let list = app.tables.firstMatch
        XCTAssertTrue(list.waitForExistence(timeout: 5), "List view did not load")
    }
}
