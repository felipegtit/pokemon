//
//  PokemonUITests.swift
//  PokemonUITests
//
//  Created by Felipe Goncalves de Toledo on 11.01.23.
//

import XCTest

final class PokemonUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }


    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let collectionView = app.collectionViews
        XCTAssertNotNil(collectionView)
        collectionView.cells.element(boundBy:0).tap()
        
        XCTAssertNotNil(app.staticTexts["Bulbasaur"])
        
    }

}
