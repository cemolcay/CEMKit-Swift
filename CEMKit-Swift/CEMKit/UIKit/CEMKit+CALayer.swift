//
//  CEMKit+CALayer.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


// MARK: - CALayer

extension CALayer {
    
    convenience init (x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init()
        self.frame = CGRect (x: x, y: y, w: w, h: h)
    }
    
    convenience init (x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, backgroundColor: UIColor) {
        self.init()
        self.frame = CGRect (x: x, y: y, w: w, h: h)
        self.backgroundColor = backgroundColor.CGColor
    }
}

extension CALayer {
    
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set {
            self.frame = CGRect (x: newValue, y: self.y, width: self.w, height: self.h)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set {
            self.frame = CGRect (x: self.x, y: newValue, width: self.w, height: self.h)
        }
    }
    
    var w: CGFloat {
        get {
            return self.frame.size.width
        } set {
            self.frame = CGRect (x: self.x, y: self.y, width: newValue, height: self.h)
        }
    }
    
    var h: CGFloat {
        get {
            return self.frame.size.height
        } set {
            self.frame = CGRect (x: self.x, y: self.y, width: self.w, height: newValue)
        }
    }
    
    
    var left: CGFloat {
        get {
            return self.x
        } set {
            self.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.x + self.w
        } set {
            self.x = newValue - self.w
        }
    }
    
    var top: CGFloat {
        get {
            return self.y
        } set {
            self.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.y + self.h
        } set {
            self.y = newValue - self.h
        }
    }
    
    var selfCenter: CGPoint {
        return CGPoint(x: w/2, y: h/2)
    }
    
    func leftWithOffset (offset: CGFloat) -> CGFloat {
        return self.left - offset
    }
    
    func rightWithOffset (offset: CGFloat) -> CGFloat {
        return self.right + offset
    }
    
    func topWithOffset (offset: CGFloat) -> CGFloat {
        return self.top - offset
    }
    
    func bottomWithOffset (offset: CGFloat) -> CGFloat {
        return self.bottom + offset
    }
    
    
    func leftWithInset (inset: CGFloat) -> CGFloat {
        return self.left + inset
    }
    
    func rightWithInset (inset: CGFloat) -> CGFloat {
        return self.right - inset
    }
    
    func topWithInset (inset: CGFloat) -> CGFloat {
        return self.top - inset
    }
    
    func bottomWithInset (inset: CGFloat) -> CGFloat {
        return self.bottom - inset
    }
    
}
