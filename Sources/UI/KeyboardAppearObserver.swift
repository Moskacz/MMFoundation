//
//  KeyboardAppearObserver.swift
//  MMFoundation
//
//  Created by Michal Moskala on 04.12.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

public class KeyboardAppearObserver {
    
    private let notificationCenter: NotificationCenter

    public var keyboardWillAppearCallback: ((CGFloat) -> Void) = { _ in }
    public var keyboardWillChangeHeight: ((CGFloat) -> Void) = { _ in }
    public var keyboardWillHideCallback = {}
    
    public init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        setupNotificationObservers()
    }
    
    public init(scrollView: UIScrollView, notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        setupNotificationObservers()
        setupCallbacks(withScrollView: scrollView)
    }
    
    private func setupNotificationObservers() {
        notificationCenter.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                       object: nil,
                                       queue: OperationQueue.main) { [weak self] notification in
            guard let height = self?.keyboardHeight(fromNotification: notification) else { return }
            self?.keyboardWillAppearCallback(height)
        }
        
        notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                       object: nil,
                                       queue: OperationQueue.main) { [weak self] _ in
            self?.keyboardWillHideCallback()
        }
        
        notificationCenter.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification,
                                       object: nil,
                                       queue: OperationQueue.main) { [weak self] notification in
            guard let height = self?.keyboardHeight(fromNotification: notification) else { return }
            self?.keyboardWillChangeHeight(height)
        }
    }
    
    private func keyboardHeight(fromNotification note: Notification) -> CGFloat? {
        guard let keyboardSize = note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return nil }
        return keyboardSize.cgRectValue.height
    }
    
    private func setupCallbacks(withScrollView scrollView: UIScrollView) {
        keyboardWillAppearCallback = { [weak scrollView] height in
            scrollView?.contentInset.bottom = height
        }
        
        keyboardWillChangeHeight = { [weak scrollView] height in
            scrollView?.contentInset.bottom = height
        }
        
        keyboardWillHideCallback = { [weak scrollView] in
            scrollView?.contentInset.bottom = 0
        }
    }
}
