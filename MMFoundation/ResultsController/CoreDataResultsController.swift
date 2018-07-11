//
//  CoreDataResultsController.swift
//  MMFoundation
//
//  Created by Michal Moskala on 11.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataResultsController<T: NSFetchRequestResult>: ResultsController<T> {
    
    private let frc: NSFetchedResultsController<T>
    
    init(frc: NSFetchedResultsController<T>) {
        self.frc = frc
    }
    
    override func object(at indexPath: IndexPath) -> T {
        return frc.object(at: indexPath)
    }
    
    override func objects(in section: Int) -> [T]? {
        guard let objects = frc.sections?[section].objects else { return nil }
        return objects as? [T]
    }
}
