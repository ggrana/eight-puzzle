//
//  SolverInterativeDeep.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/25/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class SolverInterativeDeep: Solver {
    
    var increment : Int = 1
    var currentLimit : Int = 0
    var totalVisitedNodes : Int = 0;
    
    override func getSonsClean(sons: [NodeBoard]?) -> [NodeBoard]{
        var sonsClean : [NodeBoard] = []
        if let newSons = sons {
            for son in newSons {
                if son.movesDone < currentLimit {
                    if let testingNode = knowStates[son.state!.hashValueString] {
                        if(testingNode.movesDone > son.movesDone) {
                            knowStates[son.state!.hashValueString] = son
                            sonsClean.append(son)
                        }
                    } else {
                        knowStates[son.state!.hashValueString] = son
                        sonsClean.append(son)
                    }
                    
                }
            }
        }
        if (sonsClean.count == 0 && nodesToExpand.count == 0) {
            currentLimit += increment;
            knowStates = [String: NodeBoard]()
            nodesToExpand = []
            var node = NodeBoard(state: initialState!)
            sonsClean.append(node)
        }
        return sonsClean
    }
    
    override func nextNode() -> NodeBoard {
        totalVisitedNodes++;
        var nextNode = nodesToExpand.removeLast()
        return nextNode;
    }

    
    override func status() -> String {
        if let node = currentNode {
            return "Altura: \(node.movesDone) - Conhecidos: \(knowStates.count) (\(totalVisitedNodes))"
        } else {
            return "-"
        }
    }
    
    
}
