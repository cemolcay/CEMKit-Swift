//
//  CEMKit+CGPoint.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint (x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint (x: left.x - right.x, y: left.y - right.y)
}


enum AnchorPosition: CGPoint {
    case TopLeft        = "{0, 0}"
    case TopCenter      = "{0.5, 0}"
    case TopRight       = "{1, 0}"
    
    case MidLeft        = "{0, 0.5}"
    case MidCenter      = "{0.5, 0.5}"
    case MidRight       = "{1, 0.5}"
    
    case BottomLeft     = "{0, 1}"
    case BottomCenter   = "{0.5, 1}"
    case BottomRight    = "{1, 1}"
}

extension CGPoint: StringLiteralConvertible {
    
    public init(stringLiteral value: StringLiteralType) {
        self = CGPointFromString(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self = CGPointFromString(value)
    }
    
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self = CGPointFromString(value)
    }
}
