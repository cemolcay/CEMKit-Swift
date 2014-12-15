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
        v.backgroundColor = randomColor()
        v.setAnchorPosition(AnchorPosition.MidLeft)
        view.addSubview(v)
        
        UIView.animateWithDuration(1, delay: 0, options: (.Autoreverse | .Repeat), animations: { () -> Void in
            v.setRotationY(45)
        }, completion: nil)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

