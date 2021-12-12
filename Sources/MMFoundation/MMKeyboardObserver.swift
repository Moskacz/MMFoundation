//
//  File.swift
//  
//
//  Created by Michał Moskala on 12/12/2021.
//

import UIKit

protocol MMKeyboardObserverDelegate: AnyObject {
    func keyboard(observer: MMKeyboardObserver, didDetectKeyboardFrameChange frame: CGRect)
}

final class MMKeyboardObserver {
    weak var delegate: MMKeyboardObserverDelegate?
    
    private let notificationCenter: NotificationCenter
    private weak var scrollView: UIScrollView?
    private var notificationObservers = [NSObjectProtocol]()
    
    init(notificationCenter: NotificationCenter, scrollView: UIScrollView? = nil) {
        self.notificationCenter = notificationCenter
        self.scrollView = scrollView
        self.notificationObservers = registerForNotifications(using: notificationCenter)
    }
    
    deinit {
        notificationObservers.forEach {
            notificationCenter.removeObserver($0)
        }
    }
    
    private func registerForNotifications(using notificationCenter: NotificationCenter) -> [NSObjectProtocol] {
        let showObserver = notificationCenter.addObserver(forName: UIApplication.keyboardWillShowNotification, object: self, queue: .main) { [weak self] note in
            self?.handle(notification: note)
        }
        
        let hideObserver = notificationCenter.addObserver(forName: UIApplication.keyboardWillHideNotification, object: self, queue: .main) { [weak self] note in
            self?.handle(notification: note)
        }
        
        let changeObserver = notificationCenter.addObserver(forName: UIApplication.keyboardWillChangeFrameNotification, object: self, queue: .main) { [weak self] note in
            self?.handle(notification: note)
        }
        
        return [showObserver, hideObserver, changeObserver]
    }
    
    private func handle(notification: Notification) {
        
    }
}
