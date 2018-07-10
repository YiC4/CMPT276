//
//  ConnectVCTests.swift
//  CMPT276AppTests
//
//  Created by Michael Lee on 2018-07-03.
//  Copyright © 2018 Nurture. All rights reserved.
//

import XCTest
import Firebase
import FirebaseAuth
@testable import CMPT276App
class ConnectVCTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConnectInstantiation(){ //Testing that connectvc's members are not null when connect is loaded
        let connectvc = ConnectVC()
        
        if(connectvc.isViewLoaded && (connectvc.view.window != nil)){
            XCTAssertTrue(Auth.auth().currentUser!.uid != "")
            XCTAssertTrue(connectvc.posts != nil)
            XCTAssertTrue(connectvc.postsRef != nil)
            
        }
    }
    func testConnectVCTableViewSections(){ //test to see if tableview has instatiated with correct rows and columns
        let connectvc = ConnectVC()
        
        if(connectvc.isViewLoaded && (connectvc.view.window != nil)){
            XCTAssertTrue(connectvc.numberOfSections(in: connectvc.tableView) == 1)
            XCTAssertTrue(connectvc.tableView(connectvc.tableView, numberOfRowsInSection: 1) == connectvc.posts.count)
            
        }
        
    }
    
}
