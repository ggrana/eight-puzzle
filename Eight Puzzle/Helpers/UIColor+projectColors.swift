//
//  UIColor+projectColors.swift
//  Eight Puzzle
//
//  Created by Gustavo Grana on 3/17/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    class func darkPrimaryColor() -> UIColor{
        return UIColor(hex: 0x0288D1)
    }
    
    class func primaryColor() -> UIColor{
        return UIColor(hex: 0x03A9F4)
    }
    
    class func lightPrimaryColor() -> UIColor{
        return UIColor(hex: 0xB3E5FC)
    }
    
    class func textColor() -> UIColor{
        return UIColor(hex: 0xFFFFFF)
    }
    
    class func accentColor() -> UIColor{
        return UIColor(hex: 0xFFC107)
    }
    
    class func primaryTextColor() -> UIColor{
        return UIColor(hex: 0x212121)
    }
    
    class func secondaryTextColor() -> UIColor{
        return UIColor(hex: 0x727272)
    }
    
    class func dividerColor() -> UIColor{
        return UIColor(hex: 0xB6B6B6)
    }
    
}
