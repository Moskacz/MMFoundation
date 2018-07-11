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
    
    public func resultsControllerDid(change: ResultChangeType) {
        switch change {
        case .insertRow(let path):
            insertRows(at: [path], with: .automatic)
        case .deleteRow(let path):
            deleteRows(at: [path], with: .automatic)
        case .updateRow(let path):
            reloadRows(at: [path], with: .automatic)
        case .moveRow(let fromPath, let toPath):
            moveRow(at: fromPath, to: toPath)
        case .insertSection(let index):
            insertSections(IndexSet(integer: index), with: .automatic)
        case .deleteSection(let index):
            deleteSections(IndexSet(integer: index), with: .automatic)
        }
    }
}
