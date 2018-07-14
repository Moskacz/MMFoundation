//
//  Color.swift
//  MMFoundation
//
//  Created by Michal Moskala on 13.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
public typealias Color = NSColor
#elseif os(iOS)
import UIKit
public typealias Color = UIColor
#endif

public extension Color {
    
    public func encode() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject:self)
    }
    
    public class func color(fromData data: Data) -> Color? {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? Color
    }
    
    public static func hsb(h: CGFloat, s: CGFloat, b: CGFloat) -> Color {
        #if os(iOS)
            return Color(hue: h, saturation: s, brightness: b, alpha: 1)
        #elseif os(OSX)
            return Color(deviceHue: h, saturation: s, brightness: b, alpha: 1)
        #endif
    }
}
