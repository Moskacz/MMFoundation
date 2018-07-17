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
    var nib: UINib { get }
    var reuseId: String { get }
}

extension Reusable where Self: UITableViewCell {
    
    private var cellName: String {
        return String(describing: self)
    }
    
    var nib: UINib {
        return UINib(nibName: cellName, bundle: nil)
    }
    
    var reuseId: String {
        return cellName
    }
}
