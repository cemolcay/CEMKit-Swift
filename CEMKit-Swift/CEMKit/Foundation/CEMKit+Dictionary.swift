//
//  CEMKit+Dictionary.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>,
    right: Dictionary<KeyType, ValueType>) {
        for (k, v) in right {
            left.updateValue(v, forKey: k)
        }
}

