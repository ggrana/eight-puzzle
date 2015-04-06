//
//  ShuffleTests.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/22/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit
import XCTest

class ShuffleTests: XCTestCase {

    var state : BoardState?
    
    override func setUp() {
        super.setUp()
        state = BoardState(size: 3)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShuffle(){
        var shuffle = Shuffle()
        var initialState = BoardState(size: 3)
        state = shuffle.doShuffle(state!, steps: 10)
        println(state!)
        println(initialState)
        XCTAssert(state != initialState, "BoardState is shuffled!")
    }

}
