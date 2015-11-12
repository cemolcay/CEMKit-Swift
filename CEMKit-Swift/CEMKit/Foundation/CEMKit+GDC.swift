//
//  CEMKit+GDC.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


func delay (
    seconds: Double,
    queue: dispatch_queue_t = dispatch_get_main_queue(),
    after: () -> Void) {
        
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(time, queue, after)
}

