//
//  UIViewTests.swift
//  MMFoundationTests
//
//  Created by Michal Moskala on 13.05.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import MMFoundation

class UIViewTests: XCTestCase {
    
    func test_setupRound() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.makeLayerRound()
        XCTAssertEqual(view.layer.cornerRadius, 50)
        
        view.frame = CGRect(x: 0, y: 0, width: 98, height: 98)
        view.makeLayerRound()
        XCTAssertEqual(view.layer.cornerRadius, 49)
    }
    
}
