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
        let change: ResultChangeType
        switch type {
        case .insert: change = .insertRow(path: newIndexPath!)
        case .delete: change = .deleteRow(path: indexPath!)
        case .update: change = .updateRow(path: indexPath!)
        case .move: change = .moveRow(fromPath: indexPath!, toPath: newIndexPath!)
        }
        delegate?.resultsControllerDid(change: change)
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                           didChange sectionInfo: NSFetchedResultsSectionInfo,
                           atSectionIndex sectionIndex: Int,
                           for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            delegate?.resultsControllerDid(change: .insertSection(index: sectionIndex))
        case .delete:
            delegate?.resultsControllerDid(change: .deleteSection(index: sectionIndex))
        case .move, .update:
            break
        }
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.resultsControllerDidChangeContent()
    }
}
