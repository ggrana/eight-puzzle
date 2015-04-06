//
//  ViewController.swift
//  Eight Puzzle
//
//  Created by Gustavo Grana on 3/17/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class AppViewController: BaseViewController {

    var boardViewController : BoardCollectionViewController?
    
    @IBOutlet weak var vShuffleSteps: UITextField!
    @IBOutlet weak var vSize: UITextField!
    @IBOutlet weak var vSolve: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionShuffle(sender: AnyObject) {
        self.resignFirstResponder()
        var size = vSize.text.toInt()
        if(self.boardViewController!.state.size! + 1 != size!) {
            boardViewController!.state = BoardState(size: size!)
            boardViewController!.collectionView!.reloadData()
        }
        var steps = vShuffleSteps.text.toInt()
        if (steps == nil) {
            steps = 0
        }
        boardViewController!.doShuffle(steps!)
    }
    
    func enableSolve(){
        vSolve.enabled = true;
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "BoardSegue") {
            self.boardViewController = (segue.destinationViewController as BoardCollectionViewController)
            self.boardViewController?.delegate = self
        } else if (segue.identifier! == "pushSolver"){
            var result = (segue.destinationViewController as ResultViewController)
            result.state = self.boardViewController!.state
        }
    }
    
}

