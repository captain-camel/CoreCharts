//
//  ScatterPlot+Modifiers.swift
//  
//
//  Created by Cameron Delong on 10/18/21.
//

import SwiftUI

extension ScatterPlot {
    /// Sets the color of the points on the chart.
    public func pointColor(_ color: Color) -> Self {
        var newView = self
        newView.pointColor = color
        return newView
    }
    
    /// Sets the color of the linear regression line of the data.
    public func regressionLineColor(_ color: Color) -> Self {
        var newView = self
        newView.regressionLineColor = color
        return newView
    }
    
    /// Sets the style of the linear regression line of the data.
    public func regressionLineStyle(_ style: StrokeStyle) -> Self {
        var newView = self
        newView.regressionLineStyle = style
        return newView
    }
    
    /// Sets whether to show the linear line of best fit of the data.
    public func showRegressionLine(_ visible: Bool = true) -> Self {
        var newView = self
        newView.showRegressionLine = visible
        return newView
    }
    
    /// Sets the color of the Y axis labels corresponding to the chart.
    public func yAxisLabelColor(_ color: Color) -> Self {
        var newView = self
        newView.yAxisLabelColor = color
        return newView
    }
}
