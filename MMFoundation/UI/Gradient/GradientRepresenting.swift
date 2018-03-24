//
//  GradientRepresenting.swift
//  MMFoundation
//
//  Created by Michal Moskala on 24.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public protocol GradientRepresenting {
    var colors: [UIColor] { get }
    var startPoint: CGPoint { get }
    var endPoint: CGPoint { get }
}

public struct Gradient: GradientRepresenting {
    public var colors: [UIColor]
    public var startPoint: CGPoint
    public var endPoint: CGPoint
}
