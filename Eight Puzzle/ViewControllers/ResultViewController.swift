//
//  ResultViewController.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var state : BoardState?
    var initialState : BoardState?
    var boardViewController : BoardCollectionViewController?
    var statesOrder : [BoardState] = [BoardState]()
    var showingI : Int = 0
    var block : (() -> ())?
    
    @IBOutlet weak var vTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState = state
        state = BoardState(state: initialState!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionPop(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func actionBreadth(sender: AnyObject) {
        solveShowingTime({ SolverBreadth(state: self.state!) })
    }
    
    @IBAction func actionDepth(sender: AnyObject) {
        solveShowingTime( { SolverDepth(state: self.state!) } )
    }
    
    @IBAction func iterativeDepth(sender: AnyObject) {
        solveShowingTime( { SolverInterativeDeep(state: self.state!) } )
    }
    
    @IBAction func actionAStar(sender: AnyObject) {
        solveShowingTime( { SolverAStar(state: self.state!) } )
    }
    
    @IBAction func actionRepeat(sender: AnyObject) {
        showingI = 0;
        animate()
        animation()
    }
    
    // MARK: - Private methods
    
    func solveShowingTime(closure: () -> Solver) {
        var startDate = NSDate()
        var solver = closure()
        self.vTime.text = "Calculando..."
        self.block = {
            self.vTime.text = "\(solver.status())"
        }
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("runBlock"), userInfo:nil, repeats: true)
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        dispatch_async(backgroundQueue, { () -> Void in
            var lastNode = solver.solve()
            var endDate = NSDate()
            var time = endDate.timeIntervalSinceDate(startDate)
            var ms = Int(time * 1000)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                timer.invalidate()
                self.vTime.text = "\(ms) ms - \(solver.status())"
                self.arrayFromNode(lastNode!)
            })
        })
    }
    
    func runBlock() {
        if let block = self.block {
            block()
        }
    }
    
    func arrayFromNode(lastNode : NodeBoard) {
        statesOrder = [BoardState]()
        var currentNode : NodeBoard?
        currentNode = lastNode
        while(currentNode != nil) {
            statesOrder.insert(currentNode!.state!, atIndex: 0)
            currentNode = currentNode!.parent
        }
        self.animation()
    }
    
    func animation() {
        showingI = 0;
        for i in 1...statesOrder.count {
            var interval = NSTimeInterval(Double(i) * 0.15)
            var timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("animate"), userInfo:nil, repeats: false)
        }
    }
    
    func animate(){
        state = statesOrder[showingI]
        self.boardViewController?.loadState(state!)
        showingI++;
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "BoardSegue") {
            self.boardViewController = (segue.destinationViewController as BoardCollectionViewController)
            self.boardViewController?.delegate = self
            self.boardViewController?.state = state!
        } else if segue.identifier! == "StepsSegue" {
            var stepsViewController = segue.destinationViewController as StepsViewController
            stepsViewController.steps = self.statesOrder
        }
    }

}
