//
//  CEMKit+String.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
    
    func swap (value: String, with: String) -> String {
        let ns = self as NSString
        return ns.stringByReplacingOccurrencesOfString(value, withString: with)
    }
    
    func getSizeWithFont (width: CGFloat = .max, height: CGFloat = .max, font: UIFont) -> CGSize {
        return (self as NSString).getSizeWithFont(
            width,
            height: height,
            font: font)
    }
    
    func contains (string: String, options: NSStringCompareOptions = NSStringCompareOptions.CaseInsensitiveSearch) -> Bool {
        return rangeOfString(string, options: options, range: nil, locale: nil) != nil
    }
}
