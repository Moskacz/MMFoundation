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
    
    func register(cell: Reusable) {
        register(cell.nib, forCellReuseIdentifier: cell.reuseId)
    }
}
