//
//  Shuffle.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class Shuffle: NSObject {
    
    func doShuffle(state: BoardState, steps: Int) -> BoardState{
        var rootNode = NodeBoard(state: state)
        var sons : [NodeBoard]? = rootNode.getSons()
        var selectSonAtIndex = Int(arc4random_uniform(UInt32(sons!.count)))
        var nextNode = sons![selectSonAtIndex]
        sons = nil
        if(steps > 1){
            return doShuffle(nextNode.state!, steps: steps-1)
        } else {
            return nextNode.state!
        }
    }
    
}
