//
//  CEMKit.swift
//  CEMKit-Swift
//
//  Created by Cem Olcay on 05/11/14.
//  Copyright (c) 2014 Cem Olcay. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    // MARK: Custom Initilizer

    convenience init (x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init (frame: CGRect (x: x, y: y, width: w, height: h))
    }
    
    

    // MARK: Frame Extensions
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set {
            self.frame = CGRect (x: x, y: self.y, width: self.w, height: self.h)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set {
            self.frame = CGRect (x: self.x, y: y, width: self.w, height: self.h)
        }
    }
    
    var w: CGFloat {
        get {
            return self.frame.size.width
        } set {
            self.frame = CGRect (x: self.x, y: self.y, width: w, height: self.h)
        }
    }
    
    var h: CGFloat {
        get {
            return self.frame.size.height
        } set {
            self.frame = CGRect (x: self.x, y: self.y, width: self.w, height: h)
        }
    }
    
    
    var left: CGFloat {
        return self.x
    }
    
    var right: CGFloat {
        return self.x + self.w
    }
    
    var top: CGFloat {
        return self.y
    }
    
    var bottom: CGFloat {
        return self.y + self.h
    }
    
    
    func setX (x: CGFloat, y: CGFloat) {
        setPosition(CGPoint (x: x, y: y))
    }
    
    func setW (w: CGFloat, h: CGFloat) {
        setSize(CGSize (width: w, height: h))
    }
    
    
    func setPosition (position: CGPoint) {
        self.frame = CGRect (x: position.x, y: position.y, width: self.w, height: self.h)
    }
    
    func setSize (size: CGSize) {
        self.frame = CGRect (x: self.x, y: self.y, width: size.width, height: size.height)
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
    
    func botttomWithOffset (offset: CGFloat) -> CGFloat {
        return self.bottom + offset
    }
    
    
    
    // MARK: Transform Extensions
    
    func setRotationX (x: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, degreesToRadians(x), 1.0, 0.0, 0.0)
        
        self.layer.transform = transform
    }
    
    func setRotationY (y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, degreesToRadians(y), 0.0, 1.0, 0.0)
        
        self.layer.transform = transform
    }
    
    func setRotationZ (z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, degreesToRadians(z), 0.0, 0.0, 1.0)
        
        self.layer.transform = transform
    }
    
    func setRotation (x: CGFloat, y: CGFloat, z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, degreesToRadians(x), 1.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, degreesToRadians(y), 0.0, 1.0, 0.0)
        transform = CATransform3DRotate(transform, degreesToRadians(z), 0.0, 0.0, 1.0)
        
        self.layer.transform = transform
    }
    
    
    func setScale (x: CGFloat, y: CGFloat, z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DScale(transform, x, y, z)
        
        self.layer.transform = transform
    }
    
    
    
    // MARK: Gesture Extensions
    
    func addTapGesture (tapNumber: NSInteger, target: AnyObject, action: Selector) {
        let tap = UITapGestureRecognizer (target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        self.addGestureRecognizer(tap)
    }
    
    func addSwipeGesture (direction: UISwipeGestureRecognizerDirection, numberOfTouches: Int, target: AnyObject, action: Selector) {
        let swipe = UISwipeGestureRecognizer (target: target, action: action)
        swipe.direction = direction
        swipe.numberOfTouchesRequired = numberOfTouches
        self.addGestureRecognizer(swipe)
    }
    
    func addPanGesture (target: AnyObject, action: Selector) {
        let pan = UIPanGestureRecognizer (target: target, action: action)
        self.addGestureRecognizer(pan)
    }
    
    
    
    // MARK: Layer Extensions
    
    func addShadow (offset: CGSize, radius: CGFloat, color: UIColor) {
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.CGColor
        self.layer.masksToBounds = true
    }
    
    func addBorder (width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
        self.layer.masksToBounds = true
    }
    
    
    func setCornerRadius (radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    
    func drawCircle (fillColor: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) {
        let path = UIBezierPath (roundedRect: CGRect (x: 0, y: 0, width: self.w, height: self.w), cornerRadius: self.w/2)

        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = fillColor.CGColor
        shapeLayer.strokeColor = strokeColor.CGColor
        shapeLayer.lineWidth = strokeWidth
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func drawStroke (width: CGFloat, color: UIColor) {
        let path = UIBezierPath (roundedRect: CGRect (x: 0, y: 0, width: self.w, height: self.w), cornerRadius: self.w/2)
        
        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = color.CGColor
        shapeLayer.lineWidth = width
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func drawArc (from: CGFloat, to: CGFloat, clockwise: Bool, width: CGFloat, fillColor: UIColor, strokeColor: UIColor, lineCap: String) {
        let path = UIBezierPath (arcCenter: self.center, radius: self.w/2, startAngle: degreesToRadians(from), endAngle: degreesToRadians(to), clockwise: clockwise)
        
        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = fillColor.CGColor
        shapeLayer.strokeColor = strokeColor.CGColor
        shapeLayer.lineWidth = width
        
        self.layer.addSublayer(shapeLayer)
    }
}


extension UIFont {
    
    enum FontType: String {
        case Regular = "Regular"
        case Bold = "Bold"
        case Light = "Light"
        case UltraLight = "UltraLight"
        case Italic = "Italic"
        case Thin = "Thin"
    }
    
    enum FontName: String {
        case HelveticaNeue = "HelveticaNeue"
        case Helvetica = "Helvetica"
        case Futura = "Futura"
        case Menlo = "Menlo"
    }
    
    class func Font (name: FontName, type: FontType, size: CGFloat) -> UIFont {
        return UIFont (name: name.rawValue + "-" + type.rawValue, size: size)!
    }
    
    class func HelveticaNeue (type: FontType, size: CGFloat) -> UIFont {
        return Font(.HelveticaNeue, type: type, size: size)
    }
}


var ScreenWidth : CGFloat {
    get {
        return UIScreen.mainScreen().bounds.size.width
    }
}

var ScreenHeight : CGFloat {
    get {
        return UIScreen.mainScreen().bounds.size.height
    }
}



func degreesToRadians (angle: CGFloat) -> CGFloat {
    return (CGFloat (M_PI) * angle) / 180.0
}



func setHeightOfLabel (label: UILabel) {
    label.h = heightForLabel(label.text!, label.font, label.w)
}

func heightForLabel (text: String, font: UIFont, width: CGFloat) -> CGFloat {
    let att = NSAttributedString (string: text, attributes: NSDictionary (object: font, forKey: NSFontAttributeName))
    let rect = att.boundingRectWithSize(CGSize (width: width, height: CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
    return rect.height
}



func randomColor () -> UIColor {
    var randomRed:CGFloat = CGFloat(drand48())
    
    var randomGreen:CGFloat = CGFloat(drand48())
    
    var randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
}


func RGBColor (r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor (red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
}

func RGBAColor (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor (red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}




