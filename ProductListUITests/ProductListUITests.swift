//
//  ProductListUITests.swift
//  ProductListUITests
//
//  Created by Test on 6/11/21.
//

import XCTest

class ProductListUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptySearchString() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Buscar"].tap()
        let query = app.descendants(matching: .staticText).matching(identifier: "Ingrese el texto a buscar")
        let hasErrorText = query.count > 0
        XCTAssertTrue(hasErrorText)
    }
    
    func testiPhone13Search() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["Ingrese su búsqueda"].tap()
        app.textFields["Ingrese su búsqueda"].typeText("iPhone 13")
        app.buttons["Buscar"].tap()
        
        Thread.sleep(forTimeInterval: 1)
        XCTAssertTrue(app.tables.element(boundBy: 0).cells.count > 0)
        
        let firstCellStaticTexts = app.tables.element(boundBy: 0).cells.element(boundBy: 0).staticTexts
        var containsIPhoneText = false
        for index in 0..<firstCellStaticTexts.count {
            let text = firstCellStaticTexts.element(boundBy: index).label
            containsIPhoneText = text.lowercased().contains("iphone")
            if containsIPhoneText { break }
        }
        XCTAssertTrue(containsIPhoneText)
    }

    func testNonExistingProductSearch() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["Ingrese su búsqueda"].tap()
        app.textFields["Ingrese su búsqueda"].typeText("aaa#$aaa")
        app.buttons["Buscar"].tap()
        
        Thread.sleep(forTimeInterval: 1)
        let query = app.descendants(matching: .staticText).matching(identifier: "No se encontraron productos")
        let hasNoProductsText = query.count > 0
        XCTAssertTrue(hasNoProductsText)
    }
}
