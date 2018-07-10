//
//  ViewControllerTests.swift
//  CMPT276AppTests
//
//  Created by Melissa Lee on 2018-07-03.
//  Copyright © 2018 Nurture. All rights reserved.
//

import XCTest
@testable import CMPT276App
class ViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerInitialized(){ //checking instatiated view controller members
        let vc = ViewController()
        if(vc.isViewLoaded && (vc.view.window != nil)){
            XCTAssertTrue(vc.emailField != nil)
            XCTAssertTrue(vc.passwordField != nil)
        }
    }
}
