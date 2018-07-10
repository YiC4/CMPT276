//
//  JourneyVCTests.swift
//  CMPT276AppTests
//
//  Created by Melissa Lee on 2018-07-03.
//  Copyright © 2018 Nurture. All rights reserved.
//

import XCTest
import Firebase
import FirebaseAuth
@testable import CMPT276App

class JourneyVCTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJourneyVCInstantiation(){ //test to see if tableview is instantiated
        let journeyvc = JourneyVC()
        
        if(journeyvc.isViewLoaded && (journeyvc.view.window != nil)){
            XCTAssertTrue(Auth.auth().currentUser!.uid != "")
            XCTAssertTrue(journeyvc.tableView != nil)
            XCTAssertTrue(journeyvc.logs != nil)
            XCTAssertTrue(journeyvc.postsRef != nil)
            
        }
        
    }
    func testJourneyVCTableViewSections(){ //test to see if tableview has instatiated with correct rows and columns
        let journeyvc = JourneyVC()
        
        if(journeyvc.isViewLoaded && (journeyvc.view.window != nil)){
            XCTAssertTrue(journeyvc.tableView != nil)
            XCTAssertTrue(journeyvc.numberOfSections(in: journeyvc.tableView) == 1)
            XCTAssertTrue(journeyvc.tableView(journeyvc.tableView, numberOfRowsInSection: 1) == journeyvc.logs.count)
            
        }
        
    }
    
    
}
