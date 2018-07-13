//
//  CAGradienLayer+Extension.swift
//  MMFoundation
//
//  Created by Michal Moskala on 26.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import QuartzCore

extension CAGradientLayer {
    
    public func update<T: GradientRepresenting>(with gradient: T?) {
        colors = gradient?.colors.map { $0.cgColor }
        startPoint = gradient?.startPoint ?? CGPoint.zero
        endPoint = gradient?.endPoint ?? CGPoint.zero
    }
}
