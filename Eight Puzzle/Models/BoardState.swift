//
//  BoardState.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class BoardState: NSObject {
    
    var positions : [[Int]] = []
    var size : Int?
    var emptyLine : Int?
    var emptyColumn : Int?
    
    //MARK initializers
    
    convenience init(state:BoardState) {
        self.init()
        self.size = state.size
        self.emptyColumn = state.emptyColumn
        self.emptyLine = state.emptyLine
        for line in 0 ... self.size! {
            var lineArray : [Int] = []
            for column in 0 ... self.size! {
                lineArray.append(state.positions[line][column])
            }
            positions.append(lineArray)
        }
    }
    
    convenience init(fixed: Bool){
        if(fixed) {
            self.init()
            self.size = 2
            self.emptyColumn = 0
            self.emptyLine = 2
//            self.positions = [[2,3,0],[1,8,5],[4,7,6]]
//            self.positions = [[3,0,2],[7,6,5],[4,8,1]]
//            self.positions = [[2,3,5],[1,7,8],[4,0,6]]
            self.positions = [[1,2,3],[4,8,5],[0,7,6]]
        } else {
            self.init(size:3)
        }
    }
    
    
    convenience init(size:Int){
        self.init()
        self.size = size - 1
        self.emptyColumn = self.size!
        self.emptyLine = self.size!
        for line in 0 ... self.size! {
            var lineArray : [Int] = []
            for column in 0 ... self.size! {
                lineArray.append((line * (self.size! + 1)) + column + 1)
            }
            positions.append(lineArray)
        }
        self.positions[self.size!][self.size!] = 0
    }
    
    //MARK checking states
    
    func isOrdered() -> Bool {
        for line in 0 ... self.size! {
            for column in 0 ... self.size! {
                if(self.positions[line][column] != (line * (self.size! + 1)) + column + 1) {
                    if(line == self.size! && column == self.size!){
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
        return false
    }
    
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let state = object as? BoardState {
            if state.size != self.size {
                return false
            }
            for line in 0 ... self.size! {
                for column in 0 ... self.size! {
                    if(self.positions[line][column] != state.positions[line][column]) {
                        return false
                    }
                }
            }
            return true
        } else {
            return false
        }
    }
    
    //MARK hash
    
    override var hashValue: Int {
        var result = 0
        for line in 0 ... self.size! {
            for column in 0 ... self.size! {
                result *= ((self.size! + 1) * (self.size! + 1))
                result += self.positions[line][column]
            }
        }
        return result
    }
    
    var hashValueString: String {
        var result = ""
        for line in 0 ... self.size! {
            for column in 0 ... self.size! {
                result = "\(result)\(self.positions[line][column])"
            }
        }
        return "\(result)"
    }
    //MARK NSObject
    
    override var description: String {
        var board = ""
        for line in 0 ... self.size! {
            for column in 0 ... self.size! {
                board = "\(board) \(self.positions[line][column])"
            }
            board = "\(board) \n"
        }
        return board
    }
    
}

func ==(lhs: BoardState, rhs: BoardState) -> Bool {
    return lhs.isEqual(rhs)
}