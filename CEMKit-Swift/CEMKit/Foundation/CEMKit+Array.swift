//
//  CEMKit+Array.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension Array {
    
    mutating func removeObject<U: Equatable> (object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }
}

