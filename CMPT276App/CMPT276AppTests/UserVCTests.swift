//
//  UserVCTests.swift
//  CMPT276AppTests
//
//  Created by Melissa Lee on 2018-07-03.
//  Copyright © 2018 Nurture. All rights reserved.
//

import XCTest
@testable import CMPT276App
class UserVCTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserVCinitialization(){ // To get to the user creation page, we cannot have an empty email or password field
        let uvc = UserVC()
        
        if(uvc.isViewLoaded && (uvc.view.window != nil)){
            XCTAssertTrue(uvc.emailField != "")
            XCTAssertTrue(uvc.passwordField != "")
        }
    }
    
    
    
}
