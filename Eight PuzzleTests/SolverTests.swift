//
//  SolverTests.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/25/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit
import XCTest

class SolverTests: XCTestCase {

    var state : BoardState?
    
    override func setUp() {
        super.setUp()
        state = BoardState(size: 3)
//        state = BoardState(fixed:true)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSolver() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        var solver = Solver(state: self.state!)
        var lastNode = solver.solve()
        state = lastNode!.state!
        XCTAssert(state == initialState, "Board is solved!")
    }
    
    func testSolverMeasured() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        self.measureBlock() {
            var solver = Solver(state: self.state!)
            var lastNode = solver.solve()
            self.state = lastNode!.state!
            XCTAssert(self.state == initialState, "Board is solved!")
        }
    }

    func testSolverBreadth() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        var solver = SolverBreadth(state: self.state!)
        var lastNode = solver.solve()
        state = lastNode!.state!
        XCTAssert(state == initialState, "Board is solved!")
    }
    
    func testSolverBreadthMeasured() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        self.measureBlock() {
            var solver = SolverBreadth(state: self.state!)
            var lastNode = solver.solve()
            self.state = lastNode!.state!
            XCTAssert(self.state == initialState, "Board is solved!")
        }
    }

    
    func testSolverDepth() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        var solver = SolverDepth(state: self.state!)
        var lastNode = solver.solve()
        state = lastNode!.state!
        XCTAssert(state == initialState, "Board is solved!")
    }

    
    func testSolverDepthMeasured() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        self.measureBlock() {
            var solver = SolverDepth(state: self.state!)
            var lastNode = solver.solve()
            self.state = lastNode!.state!
            XCTAssert(self.state == initialState, "Board is solved!")
        }
    }
    
    func testSolverInterativeDeep() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        var solver = SolverInterativeDeep(state: self.state!)
        var lastNode = solver.solve()
        state = lastNode!.state!
        XCTAssert(state == initialState, "Board is solved!")
    }
    
    
    func testSolverInterativeDeepMeasured() {
        var shuffle = Shuffle()
        state = shuffle.doShuffle(state!, steps: 10)
        var initialState = BoardState(size: 3)
        self.measureBlock() {
            var solver = SolverInterativeDeep(state: self.state!)
            var lastNode = solver.solve()
            self.state = lastNode!.state!
            XCTAssert(self.state == initialState, "Board is solved!")
        }
    }
    
}
