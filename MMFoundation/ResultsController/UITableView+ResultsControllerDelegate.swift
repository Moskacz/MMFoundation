//
//  UITableView+ResultsControllerDelegate.swift
//  MMFoundation
//
//  Created by Michal Moskala on 11.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

extension UITableView: ResultsControllerDelegate {
    public func resultsControllerWillChangeContent() {
        beginUpdates()
    }
    
    public func resultsControllerDidChangeContent() {
        endUpdates()
    }
    
    public func resultsControllerDid(change: ResultChangeType, section: Int) {
        switch change {
        case .insert:
            insertSections(IndexSet(integer: section), with: .automatic)
        case .delete:
            deleteSections(IndexSet(integer: section), with: .automatic)
        case .update, .move:
            break
        }
    }
    
    public func resultsControllerDid(change: ResultChangeType, itemAtPath oldPath: IndexPath?, to newPath: IndexPath?) {
        switch change {
        case .insert:
            insertRows(at: [newPath!], with: .automatic)
        case .delete:
            deleteRows(at: [oldPath!], with: .automatic)
        case .move:
            deleteRows(at: [oldPath!], with: .automatic)
            insertRows(at: [newPath!], with: .automatic)
        case .update:
            reloadRows(at: [oldPath!], with: .automatic)
        }
    }
}
