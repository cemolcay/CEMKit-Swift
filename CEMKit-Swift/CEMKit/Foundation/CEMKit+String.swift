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
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
    
    func swap (value: String, with: String) -> String {
        let ns = self as NSString
        return ns.stringByReplacingOccurrencesOfString(value, withString: with)
    }
    
    func getSizeWithFont (width: CGFloat = .max, height: CGFloat = .max, font: UIFont) -> CGSize {
        return (self as NSString).getSizeWithFont(
            width: width,
            height: height,
            font: font)
    }
}
