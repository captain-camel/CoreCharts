//
//  SwiftUIView.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// A rectangle with specific corners rounded.
struct CustomRoundedRectangle: Shape {
    // MARK: Properties
    /// The radius of the rounded corners.
    var cornerRadius: CGFloat = .infinity
    /// The corners to round.
    var corners: UIRectCorner
    
    // MARK: Methods
    /// The path of the shape.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}
