//
//  BaseViewController.swift
//  Eight Puzzle
//
//  Created by Gustavo Grana on 3/17/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet var viewDarkBackgroundCollection: Array<UIView> = []
    @IBOutlet var labelTitleCollection: Array<UILabel> = []
    @IBOutlet var labelTextCollection: Array<UILabel> = []
    @IBOutlet var labelTextBigCollection: Array<UILabel> = []
    @IBOutlet var buttonsCollection: Array<UIButton> = []
    @IBOutlet var textFieldCollection: Array<UITextField> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkBackground(viewDarkBackgroundCollection)
        titles(labelTitleCollection)
        textBig(labelTextBigCollection)
        text(labelTextCollection)
        buttons(buttonsCollection)
    }
    
    //MARK - Views
    
    func darkBackground(views:Array<UIView>) {
        for view in views {
            view.backgroundColor = UIColor.darkPrimaryColor()
        }
    }
    
    //MARK - Texts
    
    func titles(views:Array<UILabel>){
        var font = UIFont(name: "HelveticaNeue-Light", size: 48)
        for label in views {
            label.textColor = UIColor.textColor()
            label.font = font
        }
    }
    
    func textBig(views:Array<UILabel>){
        var font = UIFont(name: "HelveticaNeue-Light", size: 20)
        for label in views {
            label.textColor = UIColor.primaryTextColor()
            label.font = font
        }
    }
    
    func text(views:Array<UILabel>){
        var font = UIFont(name: "HelveticaNeue-Light", size: 16)
        for label in views {
            label.textColor = UIColor.primaryTextColor()
            label.font = font
        }
    }
    
    //MARK - Buttons
    
    func buttons(views:Array<UIButton>){
        var font = UIFont(name: "HelveticaNeue-Light", size: 20)
        for button in views {
            button.backgroundColor = UIColor.accentColor()
            button.titleLabel?.font = font
        }
    }
    
    //MARK - TextField
    
    func textField(views:Array<UILabel>){
        var font = UIFont(name: "HelveticaNeue-Light", size: 16)
        for field in views {
            field.textColor = UIColor.primaryTextColor()
            field.font = font
        }
    }
}
