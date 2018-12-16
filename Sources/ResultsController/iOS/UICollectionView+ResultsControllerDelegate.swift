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
    
    private static var changes = ObjectAssociation<NSMutableArray>()
    
    public func resultsControllerWillChangeContent() {
        layoutIfNeeded()
    }
    
    public func resultsControllerDidChangeContent() {
        guard let untypedChanges = UICollectionView.changes[self] else { return }
        let changes = untypedChanges as! [ResultChangeType]
        changes.forEach {
            switch $0 {
            case .deleteRow(let path): deleteItems(at: [path])
            case .insertRow(let path): insertItems(at: [path])
            case .updateRow(let path): reloadItems(at: [path])
            case .moveRow(let from, let to): moveItem(at: from, to: to)
            case .insertSection(let index): insertSections(IndexSet(integer: index))
            case .deleteSection(let index): deleteSections(IndexSet(integer: index))
            }
        }
    }
    
    public func resultsControllerDid(change: ResultChangeType) {
        let changes = UICollectionView.changes[self] ?? NSMutableArray()
        changes.add(change)
        UICollectionView.changes[self] = changes
    }
}
