//
//  UISegmentedControlTests.swift
//  MMFoundationTests
//
//  Created by Michal Moskala on 16.04.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import MMFoundation

class UISegmentedControlTests: XCTestCase {
    
    func test_getItems() {
        let segmentedControl = UISegmentedControl(items: ["raz", "dwa", "trzy"])
        let items = segmentedControl.items
        XCTAssertEqual(items[0], UISegmentedControl.Item.text("raz"))
        XCTAssertEqual(items[1], UISegmentedControl.Item.text("dwa"))
        XCTAssertEqual(items[2], UISegmentedControl.Item.text("trzy"))
    }
    
    func test_getItems_images() {
        let segmentedControl = UISegmentedControl(items: [UIImage(), UIImage()])
        let items = segmentedControl.items
        XCTAssertEqual(items.count, 2)
        XCTAssertNotNil(segmentedControl.imageForSegment(at: 0))
        XCTAssertNotNil(segmentedControl.imageForSegment(at: 1))
    }
    
    func test_setItems() {
        let segmentedControl = UISegmentedControl()
        segmentedControl.items = [UISegmentedControl.Item.text("raz"),
                                  UISegmentedControl.Item.text("dwa")]
        XCTAssertEqual(segmentedControl.titleForSegment(at: 0), "raz")
        XCTAssertEqual(segmentedControl.titleForSegment(at: 1), "dwa")
    }
    
    func test_setItems_images() {
        let segmentedControl = UISegmentedControl()
        segmentedControl.items = [UISegmentedControl.Item.image(UIImage()),
                                  UISegmentedControl.Item.image(UIImage())]
        XCTAssertNotNil(segmentedControl.imageForSegment(at: 0))
        XCTAssertNotNil(segmentedControl.imageForSegment(at: 1))
    }
    
    func test_init_willSetItems() {
        let segmentedControl = UISegmentedControl(items: [UISegmentedControl.Item.text("raz"),
                                                          UISegmentedControl.Item.image(UIImage())])
        XCTAssertNotNil(segmentedControl.titleForSegment(at: 0))
        XCTAssertNotNil(segmentedControl.imageForSegment(at: 1))
    }
}
