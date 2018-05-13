//
//  GradientButton.swift
//  MMFoundation
//
//  Created by Michal Moskala on 01.04.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import UIKit

public class GradientButton: UIButton {
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    public func update<T: GradientRepresenting>(with gradient: T) {
        update(with: gradient)
        setNeedsDisplay()
    }
}
