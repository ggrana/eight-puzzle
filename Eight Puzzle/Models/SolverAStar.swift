//
//  SolverAStar.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 4/1/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class SolverAStar: Solver {
    
    override func nextNode() -> NodeBoard {
        nodesToExpand.sort({($0.movesExpect + $0.movesDone) < ($1.movesExpect + $1.movesDone)})
        var nextNode = nodesToExpand.removeAtIndex(0)
        return nextNode;
    }
 
    //This only check if the piece is out of the place
//    override func getSonsClean(sons: [NodeBoard]?) -> [NodeBoard]{
//        var sonsClean = super.getSonsClean(sons)
//
//        for son in sonsClean {
//            var state = son.state!
//            var size = state.size! + 1
//            for line in 0 ... state.size! {
//                for column in 0 ... state.size! {
//                    var value = state.positions[line][column]
//                    if(value == 0) {
//                        value = size * size
//                    }
//                    if(value != (line * (size)) + column + 1) {
//                            son.movesExpect += 1
//                    }
//                }
//            }
//        }
//        return sonsClean
//    }
    
    override func getSonsClean(sons: [NodeBoard]?) -> [NodeBoard]{
        var sonsClean = super.getSonsClean(sons)

        for son in sonsClean {
            var state = son.state!
            var size = state.size! + 1
            for line in 0 ... state.size! {
                for column in 0 ... state.size! {
                    var value = state.positions[line][column]
                    if(value == 0) {
                        value = size * size
                    }
                    if(value != (line * (size)) + column + 1) {
                        value = value - 1
                        var lineDif = line - value/(size)
                        var columnDif = column - value%(size)
                        son.movesExpect += (abs(lineDif) + abs(columnDif))
                    }
                }
            }
        }
        return sonsClean
    }
    
    
}
