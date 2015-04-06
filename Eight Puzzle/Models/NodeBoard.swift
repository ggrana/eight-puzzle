//
//  NodeBoard.swift
//  Eight Puzzle
//
//  Created by Gustavo Grana on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class NodeBoard: NSObject {
   
    var state : BoardState?
    var parent : NodeBoard?
    var sons : [NodeBoard]?
    var movesDone : Int = 0
    var movesExpect : Int = 0
    
    convenience init(state: BoardState, parent: NodeBoard) {
        self.init()
        self.state = state;
        self.parent = parent;
    }
    
    convenience init(state: BoardState) {
        self.init()
        self.state = state;
    }
    
    func getSons() -> [NodeBoard] {
        if (sons == nil){
            sons = []
            var sonState : BoardState
            var sonNode : NodeBoard
            if (state?.emptyColumn > 0) {
                sonState = moveLeftSpace(state!)
                sonNode = NodeBoard(state: sonState, parent: self)
                sonNode.movesDone = self.movesDone + 1
                sons?.append(sonNode)
            }
            
            if (state?.emptyColumn < state?.size) {
                sonState = moveRightSpace(state!)
                sonNode = NodeBoard(state: sonState, parent: self)
                sonNode.movesDone = self.movesDone + 1
                sons?.append(sonNode)
            }
            
            if (state?.emptyLine > 0) {
                sonState = moveUpSapce(state!)
                sonNode = NodeBoard(state: sonState, parent: self)
                sonNode.movesDone = self.movesDone + 1
                sons?.append(sonNode)
            }
            
            if (state?.emptyLine < state?.size) {
                sonState = moveDownSpace(state!)
                sonNode = NodeBoard(state: sonState, parent: self)
                sonNode.movesDone = self.movesDone + 1
                sons?.append(sonNode)
            }
        }
        return sons!;
    }
    
    //MARK - move the free space
    
    func moveUpSapce(state:BoardState) -> BoardState {
        var newState = BoardState(state: state)
        var line = newState.emptyLine!
        var column = newState.emptyColumn!
        newState.positions[line][column] = newState.positions[line-1][column]
        newState.positions[line-1][column] = 0
        newState.emptyLine = line-1
        return newState
    }
    
    func moveDownSpace(state:BoardState) -> BoardState {
        var newState = BoardState(state: state)
        var line = newState.emptyLine!
        var column = newState.emptyColumn!
        newState.positions[line][column] = newState.positions[line+1][column]
        newState.positions[line+1][column] = 0
        newState.emptyLine = line+1
        return newState
    }
    
    func moveLeftSpace(state:BoardState) -> BoardState {
        var newState = BoardState(state: state)
        var line = newState.emptyLine!
        var column = newState.emptyColumn!
        newState.positions[line][column] = newState.positions[line][column-1]
        newState.positions[line][column-1] = 0
        newState.emptyColumn = column-1
        return newState
    }
    
    func moveRightSpace(state:BoardState) -> BoardState {
        var newState = BoardState(state: state)
        var line = newState.emptyLine!
        var column = newState.emptyColumn!
        newState.positions[line][column] = newState.positions[line][column+1]
        newState.positions[line][column+1] = 0
        newState.emptyColumn = column+1
        return newState
    }
    
    //MARK NSObject
    
    override var description: String {
        var node = "\nNode:\(state!.hashValue) Moves\(movesDone)-\(movesExpect) Parent:\(parent?.state!.hashValue) Line and Column (\(state!.emptyLine!),\(state!.emptyColumn!))\n\(state!.description)"
        return node
    }
    
}
