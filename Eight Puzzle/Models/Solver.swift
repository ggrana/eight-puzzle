//
//  Solver.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class Solver: NSObject {

    var visited : [Int: BoardState] = [Int: BoardState]()
    var knowStates : [String: NodeBoard] = [String: NodeBoard]()
    var nodesToExpand : [NodeBoard] = []
    var initialState : BoardState?
    var currentNode : NodeBoard?
    
    convenience init(state:BoardState) {
        self.init()
        initialState = state
    }
    
    func solve() -> NodeBoard? {
        var node = NodeBoard(state: initialState!)
        node.movesDone = 0
        return solveIterative(node)
    }
    
    func solveRecursive(node: NodeBoard) -> NodeBoard? {
        if(node.state!.isOrdered()){
            return node
        }
        var sons : [NodeBoard]? = node.getSons()
        knowStates[node.state!.hashValueString] = node
        var sonsClean : [NodeBoard]? = []
        for son in sons! {
            if((knowStates[son.state!.hashValueString]) == nil){
                sonsClean?.append(son)
                knowStates[son.state!.hashValueString] = son
            }
        }
        for son in sonsClean! {
            nodesToExpand.append(son)
        }
        if(nodesToExpand.count > 0) {
            return solveRecursive(nextNode());
        } else {
            return nil;
        }
    }
    
    func solveIterative(node: NodeBoard) -> NodeBoard? {
        currentNode = node
        do {
            if(currentNode!.state!.isOrdered()){
                return currentNode
            }
            var sons : [NodeBoard]? = currentNode!.getSons()
            knowStates[currentNode!.state!.hashValueString] = currentNode!
            var sonsClean = getSonsClean(sons)
            for son in sonsClean {
                nodesToExpand.append(son)
            }
            if(nodesToExpand.count > 0){
                currentNode = nextNode()
            } else {
                currentNode = nil
            }
        } while(currentNode != nil)
        return nil;
    }

    func getSonsClean(sons: [NodeBoard]?) -> [NodeBoard]{
        var sonsClean : [NodeBoard] = []
        for son in sons! {
            if((knowStates[son.state!.hashValueString]) == nil){
                knowStates[son.state!.hashValueString] = son
                sonsClean.append(son)
            }
        }
        return sonsClean
    }
    
    func nextNode() -> NodeBoard {
        var index = Int(arc4random_uniform(UInt32(nodesToExpand.count)))
        var nextNode = nodesToExpand[index]
        nodesToExpand.removeAtIndex(index)
        return nextNode;
    }
    
    func status() -> String {
        if let node = currentNode {
            return "Altura: \(node.movesDone) - Conhecidos: \(knowStates.count)"
        } else {
            return "-"
        }
    }
    
}
