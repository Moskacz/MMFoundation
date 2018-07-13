//
//  GradientView.swift
//  MMFoundation
//
//  Created by Michal Moskala on 24.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import UIKit

public class GradientView: UIView, GradientLayerBasing {
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
