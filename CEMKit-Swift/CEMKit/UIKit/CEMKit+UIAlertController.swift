//
//  CEMKit+UIView.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

func alert (
    title: String,
    message: String,
    cancelAction: ((UIAlertAction!)->Void)? = nil,
    okAction: ((UIAlertAction!)->Void)? = nil) -> UIAlertController {
        
    let a = UIAlertController (title: title, message: message, preferredStyle: .Alert)
    
    if let ok = okAction {
        a.addAction(UIAlertAction(title: "OK", style: .Default, handler: ok))
        a.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelAction))
    } else {
        a.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: cancelAction))
    }
    
    return a
}

func actionSheet (
    title: String,
    message: String,
    actions: [UIAlertAction]) -> UIAlertController {
        
    let a = UIAlertController (title: title, message: message, preferredStyle: .ActionSheet)
    
    for action in actions {
        a.addAction(action)
    }
    
    return a
}

