//
//  BarChart+Modifiers.swift
//  
//
//  Created by Cameron Delong on 10/18/21.
//

import SwiftUI

extension BarChart {
    // MARK: Methods
    /// Sets the style of the chart.
    ///
    /// - Parameter style: The ``Style`` to use when displaying the `BarChart`.
    /// - Returns: A `BarChart` using the specified ``Style``.
    public func style(_ style: Style) -> Self {
        var newView = self
        newView.style = style
        return newView
    }
    
    /// Sets the starting color of the gradient filling the bars of the
    /// `BarChart`
    ///
    /// - Parameter color: The starting color of the gradient filling the bars.
    /// - Returns: A modified `BarChart`.
    public func startColor(_ color: Color) -> Self {
        var newView = self
        newView.style.startColor = color
        return newView
    }
    
    /// Sets the ending color of the gradient filling the bars of the
    /// `BarChart`
    /// 
    /// - Parameter color: The ending color of the gradient filling the bars.
    /// - Returns: A modified `BarChart`.
    public func endColor(_ color: Color) -> Self {
        var newView = self
        newView.style.endColor = color
        return newView
    }
}
