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
    
    public var gradient: GradientRepresenting? {
        didSet {
            gradientLayer.update(with: gradient)
            setNeedsDisplay()
        }
    }
}
