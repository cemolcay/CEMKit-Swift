//
//  CEMKit+CGFloat.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit


func degreesToRadians (angle: CGFloat) -> CGFloat {
    return (CGFloat (M_PI) * angle) / 180.0
}


func normalizeValue (
    value: CGFloat,
    min: CGFloat,
    max: CGFloat) -> CGFloat {
        return (max - min) / value
}


func convertNormalizedValue (
    normalizedValue: CGFloat,
    min: CGFloat,
    max: CGFloat) -> CGFloat {
        return ((max - min) * normalizedValue) + min
}


func clamp (
    value: CGFloat,
    minimum: CGFloat,
    maximum: CGFloat) -> CGFloat {
        return min (maximum, max(value, minimum))
}


func aspectHeightForTargetAspectWidth (
    currentHeight: CGFloat,
    currentWidth: CGFloat,
    targetAspectWidth: CGFloat) -> CGFloat {
        return (targetAspectWidth * currentHeight) / currentWidth
}


func aspectWidthForTargetAspectHeight (
    currentHeight: CGFloat,
    currentWidth: CGFloat,
    targetAspectHeight: CGFloat) -> CGFloat {
        return (targetAspectHeight * currentWidth) / currentHeight
}

