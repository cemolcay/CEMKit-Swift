//
//  CEMKit+NSData.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension NSData {
    
    func toJSONDictionary () -> AnyObject? {
        
        var error: NSError?
        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(self,
            options: NSJSONReadingOptions.AllowFragments,
            error: &error)
        
        if let e = error {
            return nil
        } else {
            return json
        }
    }
    
    func toImage () -> UIImage? {
        
        return UIImage(data: self)
    }
    
}
