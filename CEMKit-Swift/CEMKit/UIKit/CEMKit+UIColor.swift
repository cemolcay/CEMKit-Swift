//
//  CEMKit+UIColor.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UIColor {
    
    class func randomColor () -> UIColor {
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed,
            green: randomGreen,
            blue: randomBlue,
            alpha: 1.0)
    }
    
    class func RGBColor (
        r: CGFloat,
        g: CGFloat,
        b: CGFloat) -> UIColor {
            return UIColor (red: r / 255.0,
                green: g / 255.0,
                blue: b / 255.0,
                alpha: 1)
    }
    
    class func RGBAColor (
        r: CGFloat,
        g: CGFloat,
        b: CGFloat,
        a: CGFloat) -> UIColor {
            return UIColor (red: r / 255.0,
                green: g / 255.0,
                blue: b / 255.0,
                alpha: a)
    }
    
    class func BarTintRGBColor (
        r: CGFloat,
        g: CGFloat,
        b: CGFloat) -> UIColor {
            return UIColor (red: (r / 255.0) - 0.12,
                green: (g / 255.0) - 0.12,
                blue: (b / 255.0) - 0.12,
                alpha: 1)
    }
    
    class func Gray (gray: CGFloat) -> UIColor {
        return self.RGBColor(gray, g: gray, b: gray)
    }
    
    class func Gray (gray: CGFloat, alpha: CGFloat) -> UIColor {
        return self.RGBAColor(gray, g: gray, b: gray, a: alpha)
    }
    
    class func HexColor (hex: String) -> UIColor {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        var rgba = hex
        if !rgba.hasPrefix("#") {
            rgba = "#" + rgba
        }
        
        let index   = advance(rgba.startIndex, 1)
        let hex     = rgba.substringFromIndex(index)
        let scanner = NSScanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        
        if scanner.scanHexLongLong(&hexValue) {
            switch (count(hex)) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
            }
        } else {
            println("Scan hex error")
        }
        
        return UIColor (red: red, green:green, blue:blue, alpha:alpha)
    }
}
