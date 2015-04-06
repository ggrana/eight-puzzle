//
//  StepsCollectionViewCell.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 4/1/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class StepsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet weak var container: UIView!
    
    var board : BoardCollectionViewController?
    
    func setState(state: BoardState){
        if let board = self.board {
            board.state = state
            board.collectionView!.reloadData()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            board = storyboard.instantiateViewControllerWithIdentifier("Board") as? BoardCollectionViewController
            board!.view.frame = CGRectMake(0, 0, 158, 158)
            board!.state = state
            container.addSubview(board!.view)
        }
    }
    
}
