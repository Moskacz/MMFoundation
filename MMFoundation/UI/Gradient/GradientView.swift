//
//  GradientView.swift
//  MMFoundation
//
//  Created by Michal Moskala on 24.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import UIKit

public class GradientView: UIView {
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    public var gradient: GradientRepresenting? {
        didSet {
            gradientLayer.colors = gradient?.colors.map { $0.cgColor }
            gradientLayer.startPoint = gradient?.startPoint ?? CGPoint.zero
            gradientLayer.endPoint = gradient?.endPoint ?? CGPoint.zero
            setNeedsDisplay()
        }
    }
}
