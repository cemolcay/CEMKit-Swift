//
//  CEMKit+UIImageView.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UIImageView {
    
    convenience init (
        frame: CGRect,
        imageName: String) {
            
        self.init (frame: frame, image: UIImage (named: imageName)!)
    }
    
    convenience init (
        frame: CGRect,
        image: UIImage) {
            
        self.init (frame: frame)
        self.image = image
        self.contentMode = .ScaleAspectFit
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        image: UIImage) {
            
        self.init (
            frame: CGRect (
                x: x,
                y: y,
                width: width,
                height: image.aspectHeightForWidth(width)),
            image: image)
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        height: CGFloat,
        image: UIImage) {
            
        self.init (
            frame: CGRect (
                x: x,
                y: y,
                width:
                image.aspectWidthForHeight(height),
            height: height),
            image: image)
    }
    
    
    func imageWithUrl (url: String) {
        NSURLConnection.imageRequest(url, success: { self.image = $0 })
    }
    
    func imageWithUrl (url: String, placeholder: UIImage) {
        self.image = placeholder
        NSURLConnection.imageRequest(url, success: { self.image = $0 })
    }
    
    func imageWithUrl (url: String, placeholderNamed: String) {
        self.image = UIImage (named: placeholderNamed)
        NSURLConnection.imageRequest(url, success: { self.image = $0 })
    }
}