//
//  Result.swift
//  MMFoundation
//
//  Created by Michal Moskala on 16.09.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public enum Result<T, E: Error> {
    case value(T)
    case error(E)
    
    public var error: E? {
        switch self {
        case .value(_): return nil
        case .error(let error): return error
        }
    }
}
