//
//  KeyboardAppearObserver.swift
//  MMFoundation
//
//  Created by Michal Moskala on 04.12.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

class KeyboardAppearObserver {
    
    private let notificationCenter: NotificationCenter
    var keyboardWillAppearCallback: ((CGFloat) -> Void) = { _ in }
    var keyboardWillChangeHeight: ((CGFloat) -> Void) = { _ in }
    var keyboardWillHideCallback = {}
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        setupNotificationObservers()
    }
    
    private func setupNotificationObservers() {
        notificationCenter.addObserver(forName: Notification.Name.UIKeyboardWillShow,
                                       object: nil,
                                       queue: OperationQueue.main) { [weak self] notification in
            guard let height = self?.keyboardHeight(fromNotification: notification) else { return }
            self?.keyboardWillAppearCallback(height)
        }
        
        notificationCenter.addObserver(forName: Notification.Name.UIKeyboardWillHide,
                                       object: nil,
                                       queue: OperationQueue.main) { [weak self] _ in
            self?.keyboardWillHideCallback()
        }
        
        notificationCenter.addObserver(forName: Notification.Name.UIKeyboardWillChangeFrame,
                                       object: nil,
                                       queue: OperationQueue.main) { [weak self] notification in
            guard let height = self?.keyboardHeight(fromNotification: notification) else { return }
            self?.keyboardWillChangeHeight(height)
        }
    }
    
    private func keyboardHeight(fromNotification note: Notification) -> CGFloat? {
        guard let keyboardSize = note.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return nil }
        return keyboardSize.cgRectValue.height
    }
}
