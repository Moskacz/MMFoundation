//
//  CGPoint+Extension.swift
//  MMFoundation
//
//  Created by Michal Moskala on 24.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {
    
    public class Cubic {
        public var topLeft: CGPoint { return CGPoint(x: 0, y: 0) }
        public var topRight: CGPoint { return CGPoint(x: 1, y: 0) }
        public var bottomLeft: CGPoint { return CGPoint(x: 0, y: 1) }
        public var bottomRight: CGPoint { return CGPoint(x: 1, y: 1) }
    }
    
    public static let cubic = Cubic()
}
