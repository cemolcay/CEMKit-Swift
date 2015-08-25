//
//  CEMKit+UIView.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


// MARK: - Animation Constants

let UIViewAnimationDuration: NSTimeInterval = 1
let UIViewAnimationSpringDamping: CGFloat = 0.5
let UIViewAnimationSpringVelocity: CGFloat = 0.5


// MARK: - Initilizers

extension UIView {
    
    // MARK: Custom Initilizer
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        w: CGFloat,
        h: CGFloat) {
            self.init (frame: CGRect (x: x, y: y, width: w, height: h))
    }
    
    convenience init (superView: UIView) {
        self.init (frame: CGRect (origin: CGPointZero, size: superView.size))
    }
}


// MARK: - Frame Extensions

extension UIView {
    
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
    
    
    var position: CGPoint {
        get {
            return self.frame.origin
        } set {
            self.frame = CGRect (origin: newValue, size: self.frame.size)
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        } set {
            self.frame = CGRect (origin: self.frame.origin, size: newValue)
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


// MARK: - Transform Extensions

extension UIView {
    
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
    
    func setRotation (
        x: CGFloat,
        y: CGFloat,
        z: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DRotate(transform, degreesToRadians(x), 1.0, 0.0, 0.0)
            transform = CATransform3DRotate(transform, degreesToRadians(y), 0.0, 1.0, 0.0)
            transform = CATransform3DRotate(transform, degreesToRadians(z), 0.0, 0.0, 1.0)
            
            self.layer.transform = transform
    }
    
    
    func setScale (
        x: CGFloat,
        y: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DScale(transform, x, y, 1)
            
            self.layer.transform = transform
    }
    
}


// MARK: - Layer Extensions

extension UIView {
    
    func setAnchorPosition (anchorPosition: AnchorPosition) {
        self.layer.anchorPoint = anchorPosition.rawValue
    }
    
    func setCornerRadius (radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func addShadow (
        offset: CGSize,
        radius: CGFloat,
        color: UIColor,
        opacity: Float,
        cornerRadius: CGFloat? = nil) {
            self.layer.shadowOffset = offset
            self.layer.shadowRadius = radius
            self.layer.shadowOpacity = opacity
            self.layer.shadowColor = color.CGColor
            
            if let r = cornerRadius {
                self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).CGPath
            }
    }
    
    func addBorder (
        width: CGFloat,
        color: UIColor) {
            self.layer.borderWidth = width
            self.layer.borderColor = color.CGColor
            self.layer.masksToBounds = true
    }
    
    func drawCircle (
        fillColor: UIColor,
        strokeColor: UIColor,
        strokeWidth: CGFloat) {
            let path = UIBezierPath (roundedRect: CGRect (x: 0, y: 0, width: self.w, height: self.w), cornerRadius: self.w/2)
            
            let shapeLayer = CAShapeLayer ()
            shapeLayer.path = path.CGPath
            shapeLayer.fillColor = fillColor.CGColor
            shapeLayer.strokeColor = strokeColor.CGColor
            shapeLayer.lineWidth = strokeWidth
            
            self.layer.addSublayer(shapeLayer)
    }
    
    func drawStroke (
        width: CGFloat,
        color: UIColor) {
            let path = UIBezierPath (roundedRect: CGRect (x: 0, y: 0, width: self.w, height: self.w), cornerRadius: self.w/2)
            
            let shapeLayer = CAShapeLayer ()
            shapeLayer.path = path.CGPath
            shapeLayer.fillColor = UIColor.clearColor().CGColor
            shapeLayer.strokeColor = color.CGColor
            shapeLayer.lineWidth = width
            
            self.layer.addSublayer(shapeLayer)
    }
    
    func drawArc (
        from: CGFloat,
        to: CGFloat,
        clockwise: Bool,
        width: CGFloat,
        fillColor: UIColor,
        strokeColor: UIColor,
        lineCap: String) {
            let path = UIBezierPath (arcCenter: self.center, radius: self.w/2, startAngle: degreesToRadians(from), endAngle: degreesToRadians(to), clockwise: clockwise)
            
            let shapeLayer = CAShapeLayer ()
            shapeLayer.path = path.CGPath
            shapeLayer.fillColor = fillColor.CGColor
            shapeLayer.strokeColor = strokeColor.CGColor
            shapeLayer.lineWidth = width
            
            self.layer.addSublayer(shapeLayer)
    }
    
}


// MARK: - Border Extensions

extension UIView {
    
    func addTopBorder (inset: UIEdgeInsets = UIEdgeInsetsZero, lineWidth: CGFloat, color: UIColor) {
        let border = CALayer(x: inset.left, y: inset.top, w: w - inset.left - inset.right, h: lineWidth)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }
    
    func addBottomBorder (inset: UIEdgeInsets = UIEdgeInsetsZero, lineWidth: CGFloat, color: UIColor) {
        let border = CALayer(x: inset.left, y: h - inset.bottom, w: w - inset.left - inset.right, h: lineWidth)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }
    
    func addLeftBorder (inset: UIEdgeInsets = UIEdgeInsetsZero, lineWidth: CGFloat, color: UIColor) {
        let border = CALayer(x: inset.left, y: inset.top, w: lineWidth, h: h - inset.top - inset.bottom)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }
    
    func addRightBorder (inset: UIEdgeInsets = UIEdgeInsetsZero, lineWidth: CGFloat, color: UIColor) {
        let border = CALayer(x: inset.left, y: inset.top, w: lineWidth, h: h - inset.top - inset.bottom)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }
    
}


// MARK: - Animation Extensions

extension UIView {
    
    class func spring (
        duration: NSTimeInterval = 0.5,
        animations: () -> Void,
        completion: ((Bool) -> Void)? = nil) {
            
            UIView.animateWithDuration(
                duration,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0,
                options: nil,
                animations: animations,
                completion: completion)
    }
    
    func spring (
        animations: (()->Void),
        completion: ((Bool)->Void)? = nil) {
            spring(UIViewAnimationDuration,
                animations: animations,
                completion: completion)
    }
    
    func spring (
        duration: NSTimeInterval,
        animations: (()->Void),
        completion: ((Bool)->Void)? = nil) {
            UIView.animateWithDuration(UIViewAnimationDuration,
                delay: 0,
                usingSpringWithDamping: UIViewAnimationSpringDamping,
                initialSpringVelocity: UIViewAnimationSpringVelocity,
                options: UIViewAnimationOptions.AllowAnimatedContent,
                animations: animations,
                completion: completion)
    }
    
    func animate (
        duration: NSTimeInterval,
        animations: (()->Void),
        completion: ((Bool)->Void)? = nil) {
            UIView.animateWithDuration(duration,
                animations: animations,
                completion: completion)
    }
    
    func animate (
        animations: (()->Void),
        completion: ((Bool)->Void)? = nil) {
            animate(
                UIViewAnimationDuration,
                animations: animations,
                completion: completion)
    }
    
    func pop () {
        setScale(1.1, y: 1.1)
        spring(0.2, animations: { [unowned self] () -> Void in
            self.setScale(1, y: 1)
            })
    }
}


// MARK: - Fading

extension UIView {
    
    func fadeIn (duration: NSTimeInterval = 0.3, completion: ((Bool) -> Void)? = nil) {
        if alpha != 1 {
            animate(duration, animations: { self.alpha = 1 }, completion: completion)
        }
    }
    
    func fadeOut (duration: NSTimeInterval = 0.3, completion: ((Bool) -> Void)? = nil) {
        if alpha != 0 {
            animate(duration, animations: { self.alpha = 0 }, completion: completion)
        }
    }
}


// MARK: - Render Extensions

extension UIView {
    
    func toImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
}

