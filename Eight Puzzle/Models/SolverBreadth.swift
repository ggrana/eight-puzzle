//
//  SolverBreadth.swift
//  Eight Puzzle
//
//  Created by Gustavo Grana on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class SolverBreadth: Solver {
    
    override func nextNode() -> NodeBoard {
        var nextNode = nodesToExpand.removeAtIndex(0)
        return nextNode;
    }
    
}
