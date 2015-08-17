//
//  CEMKit+NSString.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension NSString {
    
    func getSizeWithFont (width: CGFloat = .max, height: CGFloat = .max, font: UIFont) -> CGSize {
        return boundingRectWithSize(
            CGSize(width: width, height: height),
            options: .UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font],
            context: nil).size
    }
    
}
