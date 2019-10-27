//
// Raivo OTP
//
// Copyright (c) 2019 Tijme Gommers. All rights reserved. Raivo OTP
// is provided 'as-is', without any express or implied warranty.
//
// This source code is licensed under the CC BY-NC 4.0 license found 
// in the LICENSE.md file in the root directory of this source tree.
// 

import XCTest

class SetupUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Not implemented
    }
    
    func testWelcome() {
        let continueToStorage = app.buttons["continueToStorage"]
        XCTAssertTrue(continueToStorage.exists)
    }
    
    func testStorage() {
        app.buttons["continueToStorage"].tap()
        
        let continueToEncryption = app.buttons["continueToEncryption"]
        XCTAssertTrue(continueToEncryption.exists)
        
        let buttonEnabled = NSPredicate(format: "isEnabled == true")
        expectation(for: buttonEnabled, evaluatedWith: continueToEncryption, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testMinimumPasswordLength() {
        app.buttons["continueToStorage"].tap()
        app.buttons["continueToEncryption"].tap()
        
        // Not implemented
    }

}