//
//  CEMKit+UILabel.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

private var UILabelAttributedStringArray: UInt8 = 0

extension UILabel {
    
    var attributedStrings: [NSAttributedString]? {
        get {
            return objc_getAssociatedObject(self, &UILabelAttributedStringArray) as? [NSAttributedString]
        } set (value) {
            objc_setAssociatedObject(self, &UILabelAttributedStringArray, value, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    
    func addAttributedString (
        text: String,
        color: UIColor,
        font: UIFont) {
            var att = NSAttributedString (text: text, color: color, font: font)
            self.addAttributedString(att)
    }
    
    func addAttributedString (attributedString: NSAttributedString) {
        var att: NSMutableAttributedString?
        
        if let a = self.attributedText {
            att = NSMutableAttributedString (attributedString: a)
            att?.appendAttributedString(attributedString)
        } else {
            att = NSMutableAttributedString (attributedString: attributedString)
            attributedStrings = []
        }
        
        attributedStrings?.append(attributedString)
        self.attributedText = NSAttributedString (attributedString: att!)
    }
    
    
    
    func updateAttributedStringAtIndex (
        index: Int,
        attributedString: NSAttributedString) {
            
            if let att = attributedStrings?[index] {
                attributedStrings?.removeAtIndex(index)
                attributedStrings?.insert(attributedString, atIndex: index)
                
                let updated = NSMutableAttributedString ()
                for att in attributedStrings! {
                    updated.appendAttributedString(att)
                }
                
                self.attributedText = NSAttributedString (attributedString: updated)
            }
    }
    
    func updateAttributedStringAtIndex (
        index: Int,
        newText: String) {
            if let att = attributedStrings?[index] {
                let newAtt = NSMutableAttributedString (string: newText)
                
                att.enumerateAttributesInRange(NSMakeRange(0, count(att.string)-1),
                    options: NSAttributedStringEnumerationOptions.LongestEffectiveRangeNotRequired,
                    usingBlock: { (attribute, range, stop) -> Void in
                        for (key, value) in attribute {
                            newAtt.addAttribute(key as! String, value: value, range: range)
                        }
                    }
                )
                
                updateAttributedStringAtIndex(index, attributedString: newAtt)
            }
    }
    
    
    
    func getEstimatedSize (
        width: CGFloat = CGFloat.max,
        height: CGFloat = CGFloat.max) -> CGSize {
            return sizeThatFits(CGSize(width: width, height: height))
    }
    
    func getEstimatedHeight () -> CGFloat {
        return sizeThatFits(CGSize(width: w, height: CGFloat.max)).height
    }
    
    func getEstimatedWidth () -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.max, height: h)).width
    }
    
    
    
    func fitHeight () {
        self.h = getEstimatedHeight()
    }
    
    func fitWidth () {
        self.w = getEstimatedWidth()
    }
    
    func fitSize () {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
    
    
    
    // Text, TextColor, TextAlignment, Font
    
    convenience init (
        frame: CGRect,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            self.init(frame: frame)
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: height))
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: 10.0))
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
            self.fitHeight()
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        padding: CGFloat,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: 10.0))
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
            self.h = self.getEstimatedHeight() + 2*padding
    }
    
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        height: CGFloat,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            
            self.init(frame: CGRect (x: x, y: y, width: 10.0, height: height))
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
            self.fitSize()
    }
    
    
    
    // AttributedText
    
    convenience init (
        frame: CGRect,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            self.init(frame: frame)
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: height))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: 10.0))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
            self.fitHeight()
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        padding: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            
            self.init(frame: CGRect (x: x, y: y, width: width, height: 10.0))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
            self.fitHeight()
            self.h += padding*2
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            self.init(frame: CGRect (x: x, y: y, width: 10.0, height: 10.0))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
            self.fitSize()
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        padding: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            
            self.init(frame: CGRect (x: x, y: y, width: 10.0, height: 10.0))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
            self.fitSize()
            self.h += padding*2
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        height: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            
            self.init(frame: CGRect (x: x, y: y, width: 10.0, height: height))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
            self.fitWidth()
    }
}
