//
//  File.swift
//  MMFoundation
//
//  Created by Michal Moskala on 17.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

public protocol Reusable {
    static var nib: UINib { get }
    static var reuseId: String { get }
}

public extension Reusable where Self: UITableViewCell {

    private static var cellName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: cellName, bundle: nil)
    }

    static var reuseId: String {
        return cellName
    }
}
