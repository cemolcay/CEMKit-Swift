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
        
        let b = UILabel (
            x: 0,
            y: l.bottom,
            text: "asdkmkalsmd\ndedmed\nkdmkemandjkns",
            textColor: UIColor.blackColor(),
            textAlignment: .Center,
            font: UIFont.systemFontOfSize(20))
        b.backgroundColor = UIColor.redColor()
        view.addSubview(b)
        
        let c = UILabel (
            x: l.right,
            y: StatusBarHeight,
            width: 150,
            text: "asdjndajsndajksdnkjanj\njewfwj\njfnewkfn",
            textColor: UIColor.blackColor(),
            textAlignment: .Center,
            font: UIFont.systemFontOfSize(15))
        c.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(c)
        
        let sheeter = BlockButton (frame: CGRect (x: 0, y: 0, width: 100, height: 60))
        sheeter.top = b.botttomWithOffset(10)
        sheeter.left = 10
        sheeter.setTitle("sheet", forState: .Normal)
        sheeter.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        sheeter.actionBlock = { [unowned self] sender in
            
            self.present(actionSheet("title", "message", [
                UIAlertAction (title: "action title", style: .Default, handler: { (action) -> Void in
                    println("pressed")
                }),
                UIAlertAction (title: "another action", style: .Default, handler: { (action) -> Void in
                    println("pressed")
                }),
                UIAlertAction (title: "cancel", style: .Cancel, handler: { (action) -> Void in
                    println("pressed")
                }),
                UIAlertAction (title: "destructive", style: .Destructive, handler: { (action) -> Void in
                    println("pressed")
                })
            ]))
        }
        
        view.addSubview(sheeter)
    }
    
    
}

