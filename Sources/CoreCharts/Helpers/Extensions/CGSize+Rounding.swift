//
//  CGSize+Rounding.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import CoreGraphics

extension CGSize {
    /// Returns the `CGSize` with the width and height rounded.
    func rounded(places: Int = 0) -> Self {
        return CGSize(width: round(width * pow(10, CGFloat(places))) / pow(10, CGFloat(places)), height: round(height * pow(10, CGFloat(places))) / pow(10, CGFloat(places)))
    }
}
