//
//  YAxisLabelPosition.swift
//  
//
//  Created by Cameron Delong on 10/12/21.
//

/// Possible positions for the Y axis labels on a chart.
///
/// To set the position of the Y axis labels for a chart, use the
/// `labels(position:)` modifier.
///
///     BarChart(data: barChartData)
///         .labels(position: .right)
public enum YAxisLabelPosition {
    /// Left of the chart.
    case left
    /// Right of the chart.
    case right
}
