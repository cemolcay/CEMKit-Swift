//
//  CEMKit+NSDate.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension NSDate {
    
    func toString (format: String) -> String {
        let formatter = NSDateFormatter ()
        formatter.locale = NSLocale(localeIdentifier: "tr")
        formatter.dateFormat = format
        
        return formatter.stringFromDate(self)
    }
    
    func toJsonString() ->String {
        let timeInterval = self.timeIntervalSince1970
        let result = String(format: "/Date(%.0f000)/", arguments:[timeInterval])
        return result
    }
    
    func fromString (format: String, string: String) -> NSDate? {
        let formatter = NSDateFormatter ()
        formatter.dateFormat = format
        
        return formatter.dateFromString(string)
    }
    
}
