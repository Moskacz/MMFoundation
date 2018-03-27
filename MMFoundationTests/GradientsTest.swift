//
//  GradientsTest.swift
//  MMFoundationTests
//
//  Created by Michal Moskala on 27.03.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import MMFoundation

class GradientTests: XCTestCase {
    
    func test_whenGradientsHaveTheSameValues_thenTheyShouldBeEqual() {
        let gradient1 = Gradient(colors: [UIColor.white, UIColor.blue], direction: .skewLeft)
        let gradient2 = Gradient(colors: [UIColor.white, UIColor.blue], direction: .skewLeft)
        XCTAssertEqual(gradient1, gradient2)
    }
    
    func test_whenGradientsHaveDifferentDirection_thenTheyShouldNotBeEqual() {
        let gradient1 = Gradient(colors: [UIColor.white, UIColor.blue], direction: .skewLeft)
        let gradient2 = Gradient(colors: [UIColor.white, UIColor.blue], direction: .skewRight)
        XCTAssertNotEqual(gradient1, gradient2)
    }
    
    func test_whenGradientsHaveDifferentColors_thenTheyShouldBeNotEqual() {
        let gradient1 = Gradient(colors: [UIColor.white, UIColor.blue], direction: .skewLeft)
        let gradient2 = Gradient(colors: [UIColor.blue, UIColor.white], direction: .skewLeft)
        XCTAssertNotEqual(gradient1, gradient2)
    }
}
