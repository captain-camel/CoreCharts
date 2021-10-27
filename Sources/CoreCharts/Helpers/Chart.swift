//
//  Chart.swift
//  
//
//  Created by Cameron Delong on 10/9/21.
//

import SwiftUI

/// A chart that displays data.
protocol Chart: ChartData, View {
    // MARK: Properties
    /// The type representing the body of the chart.
    associatedtype Content: View
    
    /// The content of the chart.
    @ViewBuilder var content: Content { get }
    
    /// Whether to display the background of the chart.
    var showBackground: Bool { get set }
}

extension Chart {
    // MARK: Properties
    /// The body of the chart when used as a `View`.
    @ViewBuilder public var body: some View {
        if showBackground {
            ChartView { self }
        } else {
            self.content
        }
        
    }
}

extension Chart {
    // MARK: Methods
    /// Sets the bounds that the chart should place itself in.
    func bounds(_ bounds: ClosedRange<Double>) -> Self {
        var newView = self
        newView.bounds = bounds
        return newView
    }
}

extension Chart {
    // MARK: Methods
    /// Sets the position and specifier for the Y axis labels.
    public func labels(position: YAxisLabelPosition, specifier: String = "%.2f") -> Self {
        var newView = self
        newView.yAxisLabelsPosition = position
        newView.specifier = specifier
        return newView
    }
}

extension Chart {
    /// Sets whether to display the background of the chart.
    func showBackground(_ visible: Bool) -> Self {
        var newView = self
        newView.showBackground = visible
        return newView
    }
}
