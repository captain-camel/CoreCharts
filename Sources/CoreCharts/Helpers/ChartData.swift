//
//  ChartData.swift
//  
//
//  Created by Cameron Delong on 10/18/21.
//

import SwiftUI

/// The data in a `Chart` without its `body`.
protocol ChartData {
    // MARK: Properties
    /// The min and max values of the data.
    var bounds: ClosedRange<Double> { get set }
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String { get set }
    
    /// The position of the Y axis labels.
    var yAxisLabelsPosition: YAxisLabelPosition { get set }
    
    /// The color of the labels corresponding to the chart.
    var yAxisLabelColor: Color { get }
    
    // MARK: Methods
    /// Sets the bounds that the chart should place itself in.
    func bounds(_ bounds: ClosedRange<Double>) -> Self
}
