//
//  UIView+Extension.swift
//  MMFoundation
//
//  Created by Michal Moskala on 13/12/2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func matchParent(edgeInsets: UIEdgeInsets = UIEdgeInsets.zero, priority: UILayoutPriority = .required) {
        matchParentHorizontally(edges: edgeInsets, priority: priority)
        matchParentVertically(edges: edgeInsets, priority: priority)
    }
    
    public func matchParentHorizontally(edges: UIEdgeInsets = UIEdgeInsets.zero, priority: UILayoutPriority = .required) {
        pinToParentLeading(constant: edges.left, priority: priority)
        pinToParentTrailing(constant: edges.right, priority: priority)
    }
    
    public func matchParentVertically(edges: UIEdgeInsets = UIEdgeInsets.zero, priority: UILayoutPriority = .required) {
        pinToParentTop(constant: edges.top, priority: priority)
        pinToParentBottom(constant: edges.bottom, priority: priority)
    }
    
    public func pinToParentLeading(constant: CGFloat = 0.0, priority: UILayoutPriority = .required) {
        guard let parent = superview else { return }
        let constraint = leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
    
    public func pinToParentTrailing(constant: CGFloat = 0.0, priority: UILayoutPriority = .required) {
        guard let parent = superview else { return }
        let constraint = trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
    
    public func pinToParentTop(constant: CGFloat = 0.0, priority: UILayoutPriority = .required) {
        guard let parent = superview else { return }
        let constraint = topAnchor.constraint(equalTo: parent.topAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
    
    public func pinToParentBottom(constant: CGFloat = 0.0, priority: UILayoutPriority = .required) {
        guard let parent = superview else { return }
        let constraint = bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }
}

public extension UIView {
    
    public func makeLayerRound() {
        let cornerRadius = bounds.width * 0.5
        if abs(layer.cornerRadius - cornerRadius) > 0.01 {
            layer.cornerRadius = cornerRadius
        }
    }
    
    public func insertBlurEffectView() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        insertSubview(blurView, at: 0)
        blurView.matchParent()
    }
}
