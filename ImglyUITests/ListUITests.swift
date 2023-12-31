//
//  ListUITests.swift
//  ImglyUITests
//
//  Created by Hayk Hayrapetyan on 31.12.23.
//

import XCTest

final class ListUITests: XCTestCase {

    // MARK: Private properties

    private var app: XCUIApplication!

    // MARK: Lifecycle methods

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["enable-UITesting"]
    }

    // MARK: Test methods

    func testListTreeAndUICompatibility() {
        let branches: UInt = 3
        let url = "https://ubique.img.ly/frontend-tha/data.json"

        app.launchEnvironment[url] = createListTreeJson(branchCount: branches)
        app.launch()

        for _ in 0..<branches {
            let firstElement = app.collectionViews.cells.element(boundBy: 0)

            XCTAssert(firstElement.exists)
            firstElement.tap()
        }

        XCTAssert(app.images["detailErrorImage"].exists)
    }

    // MARK: Private methods

    private func createListTreeJson(branchCount: UInt) -> String {
        var json = "[]"

        for index in 0..<branchCount {
            if index == 0 {
                json = """
                [{"id": "0", "label": "Test \(branchCount - index)"}]
                """
            } else {
                json = """
                [{"label": "Test \(branchCount - index)", "children": \(json)}]
                """
            }
        }

        return json
    }
}
