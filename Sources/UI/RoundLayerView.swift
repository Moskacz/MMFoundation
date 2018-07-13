//
//  RoundLayerView.swift
//  MMFoundation
//
//  Created by Michal Moskala on 15.05.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import UIKit

open class RoundLayerView: UIView {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        makeLayerRound()
    }
}
