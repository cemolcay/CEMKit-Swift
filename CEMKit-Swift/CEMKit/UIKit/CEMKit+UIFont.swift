//
//  CEMKit+UIFont.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

enum FontType: String {
    case Regular = "Regular"
    case Bold = "Bold"
    case DemiBold = "DemiBold"
    case Light = "Light"
    case UltraLight = "UltraLight"
    case Italic = "Italic"
    case Thin = "Thin"
    case Book = "Book"
    case Roman = "Roman"
    case Medium = "Medium"
    case MediumItalic = "MediumItalic"
    case CondensedMedium = "CondensedMedium"
    case CondensedExtraBold = "CondensedExtraBold"
    case SemiBold = "SemiBold"
    case BoldItalic = "BoldItalic"
    case Heavy = "Heavy"
}

enum FontName: String {
    case HelveticaNeue = "HelveticaNeue"
    case Helvetica = "Helvetica"
    case Futura = "Futura"
    case Menlo = "Menlo"
    case Avenir = "Avenir"
    case AvenirNext = "AvenirNext"
    case Didot = "Didot"
    case AmericanTypewriter = "AmericanTypewriter"
    case Baskerville = "Baskerville"
    case Geneva = "Geneva"
    case GillSans = "GillSans"
    case SanFranciscoDisplay = "SanFranciscoDisplay"
    case Seravek = "Seravek"
}

extension UIFont {
    
    class func PrintFontFamily (font: FontName) {
        let arr = UIFont.fontNamesForFamilyName(font.rawValue)
        for name in arr {
            print(name)
        }
    }
    
    class func Font (
        name: FontName,
        type: FontType,
        size: CGFloat) -> UIFont {
            return UIFont (name: name.rawValue + "-" + type.rawValue, size: size)!
    }
    
    class func HelveticaNeue (
        type: FontType,
        size: CGFloat) -> UIFont {
            return Font(.HelveticaNeue, type: type, size: size)
    }

}
