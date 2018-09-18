//
//  ResultsControllerFake.swift
//  MMFoundation
//
//  Created by Michal Moskala on 18.09.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public class ResultsControllerFake<T>: ResultsController<T> {
    
    public var sections: [[T]]
    
    public init(sections: [[T]]) {
        self.sections = sections
    }
    
    public convenience init(items: [T]) {
        self.init(sections: [items])
    }
    
    public override func loadData() {
        // no op
    }
    
    public override var sectionsCount: Int {
        return sections.count
    }
    
    public override func objectsIn(section: Int) -> [T]? {
        return sections[section]
    }
    
    public override func object(at indexPath: IndexPath) -> T {
        return sections[indexPath.row][indexPath.section]
    }
    
}
