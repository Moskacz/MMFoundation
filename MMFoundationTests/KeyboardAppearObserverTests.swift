//
//  KeyboardAppearObserverTests.swift
//  MMFoundationTests
//
//  Created by Michal Moskala on 04.12.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import XCTest
@testable import MMFoundation

class KeyboardAppearObserverTests: XCTestCase {
    
    var notificationCenter: NotificationCenter!
    var sut: KeyboardAppearObserver!
    
    override func setUp() {
        super.setUp()
        notificationCenter = NotificationCenter()
        sut = KeyboardAppearObserver(notificationCenter: notificationCenter)
    }
    
    override func tearDown() {
        sut = nil
        notificationCenter = nil
        super.tearDown()
    }
    
    func test_whenKeyboardWillHideNotificationIsPosted_thenObserverShouldCallCorespondingBlock() {
        let exp = expectation(description: "block called")
        sut.keyboardWillHideCallback = {
            exp.fulfill()
        }
        
        notificationCenter.post(name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        wait(for: [exp], timeout: 0.1)
    }
    
    func test_whenKeyboardWillSHowNotificationIsPosted_thenObserverShouldCallCorespondingBlock() {
        let exp = expectation(description: "block called")
        sut.keyboardWillAppearCallback = { height in
            if height == 100 {
                exp.fulfill()
            }
        }
    
        var notification = Notification(name: Notification.Name.UIKeyboardWillShow)
        notification.userInfo = notificationPayload(withKeyboardHeight: 100)
        notificationCenter.post(notification)
        
        wait(for: [exp], timeout: 0.1)
    }
    
    func test_whenKeyboardWillChangeFrameIsPosted_thenObserverShouldCallCorespondingBlock() {
        let exp = expectation(description: "block called")
        sut.keyboardWillChangeHeight = { height in
            if height == 120 {
                exp.fulfill()
            }
        }
        
        var notification = Notification(name: Notification.Name.UIKeyboardWillChangeFrame)
        notification.userInfo = notificationPayload(withKeyboardHeight: 120)
        notificationCenter.post(notification)
        
        wait(for: [exp], timeout: 0.1)
    }
    
    // MARK: Helpers
    
    private func notificationPayload(withKeyboardHeight height: CGFloat) -> [AnyHashable: Any] {
        let rect = CGRect(x: 0, y: 0, width: 100, height: height)
        let value = NSValue(cgRect: rect)
        return [UIKeyboardFrameEndUserInfoKey: value]
    }
    
}
