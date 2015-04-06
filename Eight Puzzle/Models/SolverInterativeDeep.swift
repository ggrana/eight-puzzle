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

    override func getSonsClean(sons: [NodeBoard]?) -> [NodeBoard]{
        var sonsClean : [NodeBoard] = []
        if let newSons = sons {
            for son in newSons {
                if son.movesDone < currentLimit {
                    knowStates[son.state!.hashValueString] = son.state!
                    sonsClean.append(son)
                }
            }
            
        }
        if (sonsClean.count == 0 && nodesToExpand.count == 0) {
            currentLimit += increment;
            knowStates = [String: BoardState]()
            nodesToExpand = []
            var node = NodeBoard(state: initialState!)
            sonsClean.append(node)
        }
        return sonsClean
    }
    
    override func nextNode() -> NodeBoard {
        var nextNode = nodesToExpand.removeLast()
        return nextNode;
    }

}
