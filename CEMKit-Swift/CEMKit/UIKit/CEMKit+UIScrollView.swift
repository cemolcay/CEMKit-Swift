//
//  CEMKit+UIScrollView.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UIScrollView {
    
    var contentHeight: CGFloat {
        get {
            return contentSize.height
        } set {
            contentSize = CGSize (width: contentSize.width, height: newValue)
        }
    }
    
    var contentWidth: CGFloat {
        get {
            return contentSize.height
        } set {
            contentSize = CGSize (width: newValue, height: contentSize.height)
        }
    }
    
    var offsetX: CGFloat {
        get {
            return contentOffset.x
        } set {
            contentOffset = CGPoint (x: newValue, y: contentOffset.y)
        }
    }
    
    var offsetY: CGFloat {
        get {
            return contentOffset.y
        } set {
            contentOffset = CGPoint (x: contentOffset.x, y: newValue)
        }
    }
}
