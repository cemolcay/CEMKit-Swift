//
//  CEMKit+Size.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize (width: left.width + right.width, height: left.height + right.height)
}

func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize (width: left.width - right.width, height: left.width - right.width)
}

