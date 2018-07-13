//
//  GradientRepresenting.swift
//  MMFoundation
//
//  Created by Michal Moskala on 24.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

public protocol GradientRepresenting: Equatable {
    var colors: [UIColor] { get }
    var startPoint: CGPoint { get }
    var endPoint: CGPoint { get }
}

public struct Gradient: GradientRepresenting, Equatable {
    public var colors: [UIColor]
    public var startPoint: CGPoint
    public var endPoint: CGPoint
    
    public init(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    public init(colors: [UIColor], direction: GradientDirection) {
        let points = direction.points
        self.init(colors: colors, startPoint: points.startPoint, endPoint: points.endPoint)
    }
}

public struct GradientPoints {
    public var startPoint: CGPoint
    public var endPoint: CGPoint
}

public enum GradientDirection {
    case vertical
    case horizontal
    case skewRight
    case skewLeft
    
    public var points: GradientPoints {
        switch self {
        case .vertical:
            return GradientPoints(startPoint: CGPoint.cubic.topLeft, endPoint: CGPoint.cubic.bottomLeft)
        case .horizontal:
            return GradientPoints(startPoint: CGPoint.cubic.topLeft, endPoint: CGPoint.cubic.topRight)
        case .skewRight:
            return GradientPoints(startPoint: CGPoint.cubic.topLeft, endPoint: CGPoint.cubic.bottomRight)
        case .skewLeft:
            return GradientPoints(startPoint: CGPoint.cubic.topRight, endPoint: CGPoint.cubic.bottomLeft)
        }
    }
}
