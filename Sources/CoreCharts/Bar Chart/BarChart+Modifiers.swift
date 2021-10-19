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
    public func style(_ style: Style) -> Self {
        var newView = self
        newView.style = style
        return newView
    }
    
    /// Sets the starting color of the bar gradient.
    public func startColor(_ color: Color) -> Self {
        var newView = self
        newView.style.startColor = color
        return newView
    }
    
    /// Sets the ending color of the bar gradient.
    public func endColor(_ color: Color) -> Self {
        var newView = self
        newView.style.endColor = color
        return newView
    }
}
