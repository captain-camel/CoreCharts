//
//  LineChart+Modifiers.swift
//  
//
//  Created by Cameron Delong on 10/18/21.
//

import SwiftUI

extension LineChart {
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
    
    /// Sets the gradient color under the chart.
    public func gradientColor(_ color: Color, darkMode darkModeColor: Color? = nil) -> Self {
        var newView = self
        newView.style.gradientColor = color
        newView.style.darkModeGradientColor = darkModeColor
        return newView
    }
    
    /// Sets the glow color of the chart.
    public func glowColor(_ color: Color) -> Self {
        var newView = self
        newView.style.glowColor = color
        return newView
    }
    
    /// Sets whether the line should be curved.
    public func curved(_ curved: Bool = true) -> Self {
        var newView = self
        newView.curved = curved
        return newView
    }
    
    /// Sets whether gradient should be feathered near the edges of the chart.
    public func featherGradient(_ feather: Bool = true) -> Self {
        var newView = self
        newView.featherGradient = feather
        return newView
    }
}
