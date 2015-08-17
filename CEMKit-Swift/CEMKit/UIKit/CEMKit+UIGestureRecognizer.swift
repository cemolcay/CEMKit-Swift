//
//  CEMKit+UIGestureRecognizer.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


// MARK: Gesture Extensions

extension UIView {
    
    func addTapGesture (
        tapNumber: Int,
        target: AnyObject, action: Selector) {
            let tap = UITapGestureRecognizer (target: target, action: action)
            tap.numberOfTapsRequired = tapNumber
            addGestureRecognizer(tap)
            userInteractionEnabled = true
    }
    

    func addTapGestureWithOverlay (action: ((UITapGestureRecognizer) -> Void)?) {
        addTapGesture (1, action: {
            [unowned self] tap in
            
            var overlay: CALayer!
            
            for sub in self.layer.sublayers as! [CALayer] {
                if let tag = sub.valueForKey("nameTag") as? String {
                    if tag == "overlay layer" {
                        overlay = sub
                    }
                }
            }
            
            if overlay == nil {
                overlay = CALayer ()
                overlay.frame = self.bounds
                overlay.backgroundColor = UIColor (white: 0, alpha: 0.2).CGColor
                overlay.opacity = 0
                overlay.setValue("overlay layer", forKey: "nameTag")
            }
            
            let anim = CABasicAnimation (keyPath: "opacity")
            anim.fromValue = 0
            anim.toValue = 1
            anim.duration = 0.2
            anim.autoreverses = true
            
            overlay.addAnimation(anim, forKey: "overlayAnim")
            self.layer.addSublayer(overlay)
            
            action? (tap)
            })
    }
    

    func addSwipeGesture (
        direction: UISwipeGestureRecognizerDirection,
        numberOfTouches: Int,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
            let swipe = BlockSwipe (direction: direction,
                fingerCount: numberOfTouches,
                action: action)
            addGestureRecognizer(swipe)
            userInteractionEnabled = true
    }

    func addPanGesture (action: ((UIPanGestureRecognizer) -> Void)?) {
        let pan = BlockPan (action: action)
        addGestureRecognizer(pan)
        userInteractionEnabled = true
    }
    

    func addPinchGesture (action: ((UIPinchGestureRecognizer) -> Void)?) {
        let pinch = BlockPinch (action: action)
        addGestureRecognizer(pinch)
        userInteractionEnabled = true
    }
    

    func addLongPressGesture (action: ((UILongPressGestureRecognizer) -> Void)?) {
        let longPress = BlockLongPress (action: action)
        addGestureRecognizer(longPress)
        userInteractionEnabled = true
    }
}


// MARK: - Block Gesture Extensions

extension UIView {
    
    func addTapGesture (
        tapNumber: Int,
        action: ((UITapGestureRecognizer) -> Void)?) {
            let tap = BlockTap (tapCount: tapNumber,
                fingerCount: 1,
                action: action)
            addGestureRecognizer(tap)
            userInteractionEnabled = true
    }
    
    func addSwipeGesture (
        direction: UISwipeGestureRecognizerDirection,
        numberOfTouches: Int,
        target: AnyObject,
        action: Selector) {
            let swipe = UISwipeGestureRecognizer (target: target, action: action)
            swipe.direction = direction
            swipe.numberOfTouchesRequired = numberOfTouches
            addGestureRecognizer(swipe)
            userInteractionEnabled = true
    }
    
    
    func addPanGesture (
        target: AnyObject,
        action: Selector) {
            let pan = UIPanGestureRecognizer (target: target, action: action)
            addGestureRecognizer(pan)
            userInteractionEnabled = true
    }
    
    func addPinchGesture (
        target: AnyObject,
        action: Selector) {
            let pinch = UIPinchGestureRecognizer (target: target, action: action)
            addGestureRecognizer(pinch)
            userInteractionEnabled = true
    }
    
    func addLongPressGesture (
        target: AnyObject,
        action: Selector) {
            let longPress = UILongPressGestureRecognizer (target: target, action: action)
            addGestureRecognizer(longPress)
            userInteractionEnabled = true
    }
    
}