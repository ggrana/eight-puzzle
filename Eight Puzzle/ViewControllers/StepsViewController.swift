//
//  StepsViewController.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/19/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

let reuseIdentifierSteps = "StepsCell"

class StepsViewController: UIViewController {

    var steps : [BoardState] = [BoardState]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pop(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (steps.count)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierSteps, forIndexPath: indexPath) as! StepsCollectionViewCell
        
        cell.label.text = "\(indexPath.row + 1)."
        cell.setState(steps[indexPath.row])
        
        return cell
    }
    
}
