//
//  WeakBoxTests.swift
//  MMFoundationTests
//
//  Created by Michal Moskala on 05.01.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import MMFoundation

class WeakBoxTests: XCTestCase {
    
    func test_boxShouldNotHaveStrongReference() {
        var view: UIView? = UIView()
        let sut = WeakBox(value: view!)
        XCTAssertNotNil(sut.boxed)
        view = nil
        XCTAssertNil(sut.boxed)
    }
    
}
