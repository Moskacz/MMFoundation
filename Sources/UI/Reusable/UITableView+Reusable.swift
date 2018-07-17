//
//  UITableView+Reusable.swift
//  MMFoundation
//
//  Created by Michal Moskala on 17.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    public func register(cell: Reusable.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.reuseId)
    }
    
    public func dequeue<T: Reusable>() -> T {
        return dequeueReusableCell(withIdentifier: T.reuseId) as! T
    }
}
