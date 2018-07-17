//
//  ResultsControllerTableViewAdapter.swift
//  MMFoundation
//
//  Created by Michal Moskala on 17.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

public final class ResultsControllerTableViewAdapter<T, Cell: UITableViewCell>: NSObject, UITableViewDataSource where Cell: Reusable {
    
    private let resultsController: ResultsController<T>
    private weak var tableView: UITableView?
    
    public init(resultsController: ResultsController<T>, tableView: UITableView?) {
        self.resultsController = resultsController
        self.tableView = tableView
        super.init()
        registerCell()
    }
    
    private func registerCell() {
        tableView?.register(cell: Cell.self)
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return resultsController.sectionsCount
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.objects(in: section)?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseId)!
        return cell
    }
}
