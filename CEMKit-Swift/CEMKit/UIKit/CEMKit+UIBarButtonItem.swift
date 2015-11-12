//
//  CEMKit+UIBarButtonItem.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UIBarButtonItem {
    
    convenience init (imageName: String, size: CGFloat, action: () -> Void) {
        
        let button = BlockButton (frame: CGRect(x: 0, y: 0, width: size, height: size))
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.action = { sender in action() }
        
        self.init(customView: button)
    }
    
    convenience init (imageName: String, action: () -> Void) {
        self.init(imageName: imageName, size: 20, action: action)
    }
    
    convenience init (title: String, color: UIColor, action: () -> Void) {
        let button = BlockButton (frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(color, forState: .Normal)
        button.action = { sender in action() }
        button.sizeToFit()
        
        self.init(customView: button)
    }
    
}
