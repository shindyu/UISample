//
//  SelectTableViewController.swift
//  UISampleAppTests
//
//  Created by shindyu on 2017/12/28.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import XCTest
@testable import UISampleApp

class SelectTableViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_initialize() {
        let vc = SelectTableViewController()

        XCTAssertNotNil(vc.tableView)
    }
}
