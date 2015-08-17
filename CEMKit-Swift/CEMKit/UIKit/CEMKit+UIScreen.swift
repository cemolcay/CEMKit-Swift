//
//  CEMKit+UIScreen.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UIScreen {
    
    class var Orientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    class var NavigationFrame: CGRect {
        return CGRect (x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 64)
    }
    
    class var ScreenWidth: CGFloat {
        if UIInterfaceOrientationIsPortrait(Orientation) {
            return UIScreen.mainScreen().bounds.size.width
        } else {
            return UIScreen.mainScreen().bounds.size.height
        }
    }
    
    class var ScreenHeight: CGFloat {
        if UIInterfaceOrientationIsPortrait(Orientation) {
            return UIScreen.mainScreen().bounds.size.height
        } else {
            return UIScreen.mainScreen().bounds.size.width
        }
    }
    
    class var StatusBarHeight: CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
    }
}

