//
//  BoardCollectionViewController.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/26/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

let reuseIdentifier = "BoardCell"

class BoardCollectionViewController: UICollectionViewController {

    var delegate : UIViewController?
    var state : BoardState = BoardState(size: 3)
//    var state : BoardState = BoardState(fixed: true)
    var shuffle : Shuffle = Shuffle()
    
    // MARK: public methods
    
    func doShuffle(steps : Int) {
        if(steps == 0) {
            return
        }
        for i in 1...steps {
            var interval = NSTimeInterval(Double(i) * 0.15)
            var timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("doShuffle"), userInfo:nil, repeats: false)
        }
        var total = NSTimeInterval(Double(steps) * 0.15)
        var timer = NSTimer.scheduledTimerWithTimeInterval(total, target: self, selector: Selector("finished"), userInfo:nil, repeats: false)
    }
    
    func doShuffle() {
        state = shuffle.doShuffle(state, steps: 1)
        self.collectionView?.reloadData()
    }
    
    func finished() {
//        delegate.enableSolve()
    }
    
    func loadState(newState : BoardState) {
        state = newState
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (state.size! + 1) * (state.size! + 1)
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BoardCollectionViewCell
        
        cell.label.text = "\(state.positions[indexPath.row/(state.size! + 1)][indexPath.row%(state.size! + 1)])"
        if(cell.label.text == "0") {
            cell.hidden = true
        } else {
            cell.hidden = false
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var line = indexPath.row/(state.size! + 1)
        var column = indexPath.row%((state.size! + 1))
        if(line == state.emptyLine && column == state.emptyColumn){
            return
        } else if line == state.emptyLine! || column == state.emptyColumn! {
            state.positions[state.emptyLine!][state.emptyColumn!] = state.positions[line][column]
            state.positions[line][column] = 0
            state.emptyLine = line
            state.emptyColumn = column
            self.collectionView?.reloadData()
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size = CGFloat((154 - (2 * (state.size!)))/(state.size! + 1))
        return CGSizeMake(size, size);
    }
    
}
