//
//  CellDescriptor.swift
//  MMFoundation
//
//  Created by Michal Moskala on 17.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public protocol CellDescriptor {
    associatedtype Cell
    associatedtype T
    func configure(cell: Cell, with object: T)
}
