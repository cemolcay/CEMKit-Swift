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
        
        let att = NSAttributedString.withAttributedStrings({ att in
            att.appendAttributedString (NSAttributedString(
                text: "asd",
                color: UIColor.blackColor(),
                font: UIFont.systemFontOfSize(22)))
            att.appendAttributedString (NSAttributedString(
                text: "\nasd",
                color: UIColor.blueColor(),
                font: UIFont.systemFontOfSize(15)))
            att.appendAttributedString (NSAttributedString(
                text: "\nasdjnfje",
                color: UIColor.redColor(),
                font: UIFont.systemFontOfSize(25)))
            att.appendAttributedString (NSAttributedString(
                text: "\nasd",
                color: UIColor.blackColor(),
                font: UIFont.Font(.AvenirNext,
                    type: UIFont.FontType.DemiBold,
                    size: 15),
                style: .underline(.StyleSingle, UIColor.blueColor())))
        })
        
        
        let l = UILabel (
            x: 0,
            y: 0,
            attributedText: att,
            textAlignment: .Left)
        l.backgroundColor = UIColor.yellowColor()
        view.addSubview(l)
    }
    
    
}

