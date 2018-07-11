//
//  CoreDataResultsController.swift
//  MMFoundation
//
//  Created by Michal Moskala on 11.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataResultsController<T: NSFetchRequestResult>: ResultsController<T>, NSFetchedResultsControllerDelegate {
    
    private let frc: NSFetchedResultsController<T>
    
    init(frc: NSFetchedResultsController<T>) {
        self.frc = frc
    }
    
    override func object(at indexPath: IndexPath) -> T {
        return frc.object(at: indexPath)
    }
    
    override func objects(in section: Int) -> [T]? {
        return frc.sections?[section].objects as? [T]
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    
    public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.resultsControllerWillChangeContent()
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                           didChange anObject: Any,
                           at indexPath: IndexPath?,
                           for type: NSFetchedResultsChangeType,
                           newIndexPath: IndexPath?) {
        delegate?.resultsControllerDid(change: type.changeType, itemAtPath: indexPath, to: newIndexPath)
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                           didChange sectionInfo: NSFetchedResultsSectionInfo,
                           atSectionIndex sectionIndex: Int,
                           for type: NSFetchedResultsChangeType) {
        delegate?.resultsControllerDid(change: type.changeType, section: sectionIndex)
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.resultsControllerDidChangeContent()
    }
}

extension NSFetchedResultsChangeType {
    var changeType: ResultChangeType {
        switch self {
        case .delete: return .delete
        case .insert: return .insert
        case .move: return .move
        case .update: return .update
        }
    }
}
