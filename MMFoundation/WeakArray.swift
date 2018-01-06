//
//  WeakArray.swift
//  MMFoundation
//
//  Created by Michal Moskala on 06.01.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public class WeakArray<T:AnyObject> {
    
    private var items: [WeakBox<T>]
    
    public init(items: [T] = []) {
        self.items = items.map { WeakBox(value: $0) }
    }
    
    public func add(item: T) {
        items.append(WeakBox(value: item))
    }
}

extension WeakArray: Collection {
    
    public var startIndex: Int { return items.startIndex }
    public var endIndex: Int { return items.endIndex }
    
    public subscript(_ index: Int) -> T? {
        return items[index].boxed
    }
    
    public func index(after i: Int) -> Int {
        return items.index(after: i)
    }
}
