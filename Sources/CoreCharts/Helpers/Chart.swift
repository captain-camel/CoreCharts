//
//  Chart.swift
//  
//
//  Created by Cameron Delong on 10/9/21.
//

import SwiftUI

/// A chart to display data.
typealias Chart = ChartData & View

/// The data in a `Chart` without its `body`.
protocol ChartData {
    // MARK: Properties
    /// The min and max values of the data.
    var bounds: ClosedRange<Double> { get set }
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String { get }
    
    /// The position of the Y axis labels.
    var yAxisLabelsPosition: YAxisLabelPosition { get }
    
    /// The color of the labels corresponding to the chart.
    var labelColor: Color { get }
    
    // MARK: Methods
    /// Sets the bounds that the chart should place itself in.
    func bounds(_ bounds: ClosedRange<Double>) -> Self
}

extension ChartData {
    // MARK: Methods
    /// Sets the bounds that the chart should place itself in.
    func bounds(_ bounds: ClosedRange<Double>) -> Self {
        var newView = self
        newView.bounds = bounds
        return newView
    }
}
