//
//  CEMKit+NSAttributedString.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


enum NSAttributedStringStyle {
    case plain
    case underline (NSUnderlineStyle, UIColor)
    case strike (UIColor, CGFloat)
    
    func attribute () -> [NSString: NSObject] {
        switch self {
            
        case .plain:
            return [:]
            
        case .underline(let styleName, let color):
            return [NSUnderlineStyleAttributeName: styleName.rawValue, NSUnderlineColorAttributeName: color]
            
        case .strike(let color, let width):
            return [NSStrikethroughColorAttributeName: color, NSStrikethroughStyleAttributeName: width]
        }
    }
}

extension NSAttributedString {
    
    // MARK: Init
    
    convenience init (
        text: String,
        color: UIColor,
        font: UIFont,
        style: NSAttributedStringStyle = .plain) {
            
            var atts = [NSFontAttributeName as NSString: font, NSForegroundColorAttributeName as NSString: color]
            atts += style.attribute()
            
            self.init (string: text, attributes: atts)
    }
    
    convenience init (image: UIImage) {
        let att = NSTextAttachment ()
        att.image = image
        self.init (attachment: att)
    }
    
    convenience init? (string: String, html: String) {
        self.init(
            data: (html + string).dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!,
            options: [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding],
            documentAttributes: nil,
            error: nil)
    }
    
    
    // MARK: Static Init
    
    class func withAttributedStrings (mutableString: (NSMutableAttributedString) -> Void) -> NSAttributedString {
        var mutable = NSMutableAttributedString ()
        mutableString (mutable)
        return mutable
    }
    
    
    // MARK: Building
    
    func addAtt (attribute: [NSString: NSObject]) -> NSAttributedString {
        let mutable = NSMutableAttributedString (attributedString: self)
        let c = count(string)
        
        for (key, value) in attribute {
            mutable.addAttribute(key as! String, value: value, range: NSMakeRange(0, c))
        }
        
        return mutable
    }
    
    func addStyle (style: NSAttributedStringStyle) -> NSAttributedString {
        return addAtt(style.attribute())
    }
    
    
    // MARK: Size
        
    func getSize (width: CGFloat = .max, height: CGFloat = .max) -> CGSize {
        return boundingRectWithSize(
            CGSize(width: width, height: height),
            options: .UsesLineFragmentOrigin,
            context: nil).size
    }

}

