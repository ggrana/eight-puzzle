//
//  BoardStateTests.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/22/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit
import XCTest

class BoardStateTests: XCTestCase {

    var state : BoardState?
    
    override func setUp() {
        super.setUp()
        state = BoardState(size: 3)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIsOrdered() {
        var pass = state!.isOrdered()
        XCTAssert(pass, "BoardState is Ordered!")
    }
    
    func testIsEquals(){
        XCTAssert(state!.isEqual(state), "BoardState are Equals!")
    }

    func testIsNotEquals(){
        var otherState = BoardState(size: 4)
        XCTAssert(!state!.isEqual(otherState), "BoardState are not Equals!")
    }
    
}
