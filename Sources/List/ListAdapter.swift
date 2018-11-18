//
//  ListAdapter.swift
//  MMFoundation
//
//  Created by Michal Moskala on 18/11/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

open class ListAdapter<Item> {
    public init() {}
    open var numberOfSections: Int { fatalError() }
    open func numberOfRows(in section: Int) -> Int { fatalError() }
    open func item(at indexPath: IndexPath) -> Item { fatalError() }
    open func title(for section: Int) -> String { fatalError() }
}
