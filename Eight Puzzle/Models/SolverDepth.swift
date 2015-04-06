//
//  SolverDepth.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/25/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class SolverDepth: Solver {
    
    override func nextNode() -> NodeBoard {
        var nextNode = nodesToExpand.removeLast()
        return nextNode;
    }
    
}
