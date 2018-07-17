//
//  ResultsControllerTableViewAdapter.swift
//  MMFoundation
//
//  Created by Michal Moskala on 17.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
import UIKit

public final class ResultsControllerTableViewAdapter<T> {
    
    private let resultsController: ResultsController<T>
    private weak var tableView: UITableView?
    
    public init(resultsController: ResultsController<T>, tableView: UITableView?) {
        self.resultsController = resultsController
        self.tableView = tableView
    }
}
