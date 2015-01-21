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

        let scroll = DequeuableScrollView (frame: view.frame)
        view.addSubview(scroll)
        
        var contenth: CGFloat = 10
        for _ in 0...1000 {
            let i = item()
            i.y = contenth
            contenth += i.h + 10
            scroll.addSubview(i)
        }
        scroll.contentHeight = contenth
    }
    
    func item () -> UIView {
        let v = UIView (x: 10, y: 0, w: ScreenWidth-20, h: 100)
        v.backgroundColor = UIColor.randomColor()
        
        let c = UIView (x: 0, y: 0, w: 10, h: 10)
        c.backgroundColor = UIColor.randomColor()
        v.addSubview(c)
        
        let d = UIView (x: 0, y: 10, w: 10, h: 10)
        d.backgroundColor = UIColor.randomColor()
        v.addSubview(d)
        
        let e = UIView (x: 0, y: 20, w: 10, h: 10)
        e.backgroundColor = UIColor.randomColor()
        v.addSubview(e)
        
        
        return v
    }
}

