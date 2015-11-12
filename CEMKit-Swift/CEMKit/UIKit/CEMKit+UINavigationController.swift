//
//  CEMKit+UINavigationController.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UINavigationController {
    
    func resetNavBar () {
        navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
    }
    
    func transparentNavBar () {
        navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationBar.shadowImage = UIImage()
        navigationBar.translucent = true
        navigationBar.backgroundColor = UIColor.clearColor()
    }
}
