//
//  WeakBox.swift
//  MMFoundation
//
//  Created by Michal Moskala on 05.01.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

final class WeakBox<T:AnyObject> {
    
    public weak var boxed: T?
    
    public init(value: T) {
        boxed = value
    }
    
}
