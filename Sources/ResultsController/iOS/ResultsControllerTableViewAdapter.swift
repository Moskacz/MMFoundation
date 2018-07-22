//
//  ResultsControllerTableViewAdapter.swift
//  MMFoundation
//
//  Created by Michal Moskala on 17.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

open class ResultsControllerTableViewAdapter<T, Cell: UITableViewCell, Descriptor: CellDescriptor>: NSObject, UITableViewDataSource where Cell: Reusable, Descriptor.T == T, Descriptor.Cell == Cell {
    
    private let resultsController: ResultsController<T>
    private let cellDescriptor: Descriptor
    private weak var tableView: UITableView?
    
    public init(resultsController: ResultsController<T>, cellDescriptor: Descriptor, tableView: UITableView?) {
        self.resultsController = resultsController
        self.cellDescriptor = cellDescriptor
        self.tableView = tableView
        super.init()
        registerCell()
    }
    
    private func registerCell() {
        tableView?.register(cell: Cell.self)
    }
    
    // MARK: UITableViewDataSource
    
    public final func numberOfSections(in tableView: UITableView) -> Int {
        return resultsController.sectionsCount
    }
    
    public final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.objects(in: section)?.count ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeue()
        let object = resultsController.object(at: indexPath)
        cellDescriptor.configure(cell: cell, with: object)
        return cell
    }
}
