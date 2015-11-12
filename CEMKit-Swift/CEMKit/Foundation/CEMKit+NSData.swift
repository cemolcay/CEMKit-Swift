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
        let json: AnyObject?
        do {
            json = try NSJSONSerialization.JSONObjectWithData(self,
                        options: NSJSONReadingOptions.AllowFragments)
        } catch let error1 as NSError {
            error = error1
            json = nil
        }
        
        if let _ = error {
            return nil
        } else {
            return json
        }
    }
    
    func toImage () -> UIImage? {
        
        return UIImage(data: self)
    }
    
}
