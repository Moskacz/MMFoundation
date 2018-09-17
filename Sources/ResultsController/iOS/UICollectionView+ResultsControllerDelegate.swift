//
//  UICollectionView+ResultsControllerDelegate.swift
//  MMFoundation-iOS
//
//  Created by Michal Moskala on 17.09.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView: ResultsControllerDelegate {
    
    public func resultsControllerWillChangeContent() {
        // no op
    }
    
    public func resultsControllerDidChangeContent() {
        reloadData()
    }
    
    public func resultsControllerDid(change: ResultChangeType) {
        // no op
    }
    
}
