//
//  File.swift
//  
//
//  Created by Michał Moskala on 12/12/2021.
//

import UIKit

final class MMKeyboardObserver {
    
    private weak var scrollView: UIScrollView?
    
    init(notificationCenter: NotificationCenter, scrollView: UIScrollView? = nil) {
        self.scrollView = scrollView
        registerForNotifications(using: notificationCenter)
    }
    
    private func registerForNotifications(using notificationCenter: NotificationCenter) {
        
    }
}
