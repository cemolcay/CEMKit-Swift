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
        cemkitDemo()
    }
    
    
    func cemkitDemo () {
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
                    type: .DemiBold,
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
        
        let c = UILabel (
            x: l.right,
            y: UIScreen.StatusBarHeight,
            width: 150,
            text: "asdjndajsndajksdnkjanj\njewfwj\njfnewkfn",
            textColor: UIColor.blackColor(),
            textAlignment: .Center,
            font: UIFont.systemFontOfSize(15))
        c.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(c)
        
        let sheeter = BlockButton (frame: CGRect (x: 0, y: 0, width: 100, height: 60))
        sheeter.top = c.bottomWithOffset(10)
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
        
        NSURLConnection.jsonRequest("https://api.github.com/repositories",
            success: { json in
                println (json)
            },
            error: { error in
                println("error" + error.description)
            })
        
        view.addSubview(sheeter)
    }
    
    
}

