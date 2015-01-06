//
//  ViewController.swift
//  CEMKit-Swift
//
//  Created by Cem Olcay on 05/11/14.
//  Copyright (c) 2014 Cem Olcay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView (x: 100, y: 100, w: 100, h: 100)
        v.backgroundColor = UIColor.randomColor()
        v.setAnchorPosition(AnchorPosition.MidCenter)
        view.addSubview(v)
        
        UIView.animateWithDuration(1, delay: 0, options: (.Autoreverse | .Repeat), animations: { () -> Void in
            v.setScale(0.8, y: 0.8)
        }, completion: nil)
        
//        UIView.animateWithDuration(1, delay: 0, options: (.Autoreverse | .Repeat), animations: { () -> Void in
//            v.setRotationY(45)
//        }, completion: nil)

//        let anim = CABasicAnimation (keyPath: "transform.rotation.x")
//        anim.fromValue = degreesToRadians(0)
//        anim.toValue = degreesToRadians(45)
//        anim.autoreverses = true
//        anim.duration = 0.5
//        anim.repeatCount = Float.infinity
//        
//        v.layer.addAnimation(anim, forKey: "rotanim")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

