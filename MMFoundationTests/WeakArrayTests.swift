//
//  WeakArrayTests.swift
//  MMFoundationTests
//
//  Created by Michal Moskala on 06.01.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import MMFoundation

class WeakArrayTests: XCTestCase {
    
    func test_subscriptShouldReturnBoxedObject() {
        let view1 = UIView()
        let view2 = UIView()
        let sut = WeakArray(items: [view1, view2])
        XCTAssertEqual(sut[0], view1)
        XCTAssertEqual(sut[1], view2)
    }
    
    func test_arrayShouldNotHaveStrongReferenceToAnyItem() {
        var view1: UIView?  = UIView()
        let sut = WeakArray(items: [view1!])
        XCTAssertNotNil(sut[0])
        view1 = nil
        XCTAssertNil(sut[0])
    }
    
}
