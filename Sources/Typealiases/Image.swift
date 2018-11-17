//
//  Image.swift
//  MMFoundation
//
//  Created by Michal Moskala on 13.07.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
public typealias Image = NSImage
#elseif os(iOS)
import UIKit
public typealias Image = UIImage
#endif

extension Image {
    
    public var pngRepresentation: Data? {
        #if os(OSX)
        guard let data = tiffRepresentation else { return nil }
        return NSBitmapImageRep(data: data)?.representation(using: .png, properties: [:])
        #elseif os(iOS)
        return pngData()
        #endif
    }
}
