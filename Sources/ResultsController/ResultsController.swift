//
//  ResultsController.swift
//  MMFoundation
//
//  Created by Michal Moskala on 11.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

open class ResultsController<T>: NSObject {
    open weak var delegate: ResultsControllerDelegate?
    open func loadData() throws { fatalError("abstract method")}
    open func object(at indexPath: IndexPath) -> T { fatalError("abstract method") }
    open var sectionsCount: Int { fatalError("abstract method") }
    open func objects(in section: Int) -> [T]? { fatalError("abstract method")}
}

public protocol ResultsControllerDelegate: class {
    func resultsControllerWillChangeContent()
    func resultsControllerDidChangeContent()
    func resultsControllerDid(change: ResultChangeType)
}

public enum ResultChangeType {
    case insertRow(path: IndexPath)
    case deleteRow(path: IndexPath)
    case updateRow(path: IndexPath)
    case moveRow(fromPath: IndexPath, toPath: IndexPath)
    
    case insertSection(index: Int)
    case deleteSection(index: Int)
}
