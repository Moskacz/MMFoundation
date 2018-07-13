//
//  GradientLayerBasing.swift
//  MMFoundation
//
//  Created by Michal Moskala on 13.05.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import UIKit

public protocol GradientLayerBasing {
    var gradientLayer: CAGradientLayer { get }
}

public extension GradientLayerBasing where Self: UIView {
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    public func update<T: GradientRepresenting>(with gradient: T?) {
        gradientLayer.update(with: gradient)
        setNeedsDisplay()
    }
}
