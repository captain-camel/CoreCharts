//
//  BarChart.swift
//  
//
//  Created by Cameron Delong on 10/8/21.
//

import SwiftUI

/// A chart that shows bars for each data point.
///
/// The bar chart displays one bar for each provided data point. Each bar
/// extends up or down all the way to `0`. A horizontal line marks that point,
/// where negative and positive bars meet.
///
/// The following creates a bar chart with values ascending from -3 to 3.
///
/// ```swift
/// BarChart(data: [-3, -2, -1, 0, 1, 2, 3])
/// ```
///
/// A `BarChart` can be used inside of a `ChartView` with other charts.
///
/// ```swift
/// ChartView {
///     BarChart(data: barChartData)
///     LineChart(data: lineChartData)
/// }
/// ```
///
/// The style of a `BarChart` defines the colors of each of its elements. You can set
/// the style of a `BarChart` using the ``style(_:)`` view modifier. There are
/// a variety of built in styles with colors that look great together. The
/// default style is ``Style/blue``.
///
/// ```swift
/// ChartView {
///     BarChart(data: [1, 2, 3])
///         .style(.green)
///     BarChart(data: [3, 2, 1])
///         .style(.orange)
/// }
/// ```
///
/// You can also create a custom style for the `BarChart` to use.
///
/// ```swift
/// BarChart(data: barChartData)
///     .style(.init(
///         startColor: .blue,
///         endColor: .green,
///         labelColor: .red
///     ))
/// ```
public struct BarChart: Chart {
    // MARK: Properties
    /// The data displayed.
    private let data: [Double]
    
    /// The style defining the colors of the chart.
    var style: Style = .blue
    
    /// The min and max values of the data.
    public var bounds: ClosedRange<Double>
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    public var specifier: String = "%.2f"
    
    /// The position of the Y axis labels.
    public var yAxisLabelsPosition: YAxisLabelPosition = .left
    
    /// The color of the labels corresponding to the chart.
    public var yAxisLabelColor: Color { style.labelColor }
    
    /// Whether to display the background of the chart.
    public var showBackground = true
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between each bar.
    private var barSpacing: CGFloat {
        if data.count == 0 {
            return 0
        }
        
        return 1 / CGFloat(data.count) * 90
    }
    
    /// The width of the bars in the chart.
    private var barWidth: CGFloat {
        if data.count == 0 {
            return 0
        }
        
        return min(size.width / CGFloat(data.count) - barSpacing, 100)
    }
    
    // MARK: Initializers
    /// Creates a bar chart from an array of `Double`s.
    ///
    /// - Parameter data: The array of `Double`s to display.
    public init(data: [Double]) {
        self.data = data
        self.bounds = min(data.min() ?? 0, 0)...max(data.max() ?? 0, 0)
    }
    
    // MARK: Body
    public var content: some View {
        ZStack(alignment: .bottom) {
            HStack(alignment: .bottom, spacing: barSpacing) {
                ForEach(data, id: \.self) { value in
                    CustomRoundedRectangle(cornerRadius: 3, corners: [.topLeft, .topRight])
                        .fill(LinearGradient(gradient: Gradient(colors: [style.startColor, style.endColor]), startPoint: .bottom, endPoint: .top))
                        .frame(width: barWidth, height: abs(getHeight(value: value)))
                        .scaleEffect(y: value < 0 ? -1 : 1, anchor: .bottom)
                        .offset(y: getHeight(value: min(bounds.lowerBound, 0)))
                }
            }
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: getHeight(value: max(bounds.upperBound, 0))))
                path.addLine(to: CGPoint(x: size.width, y: getHeight(value: max(bounds.upperBound, 0))))
            }
            .stroke(Color(.systemGray3), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
        }
        .readSize($size)
    }
    
    // MARK: Methods
    /// Returns the height of a bar based on its value.
    private func getHeight(value: Double) -> CGFloat {
        let range = max(bounds.upperBound, 0) - min(bounds.lowerBound, 0)
        
        if range == 0 {
            return 0
        }
        
        return value / range * size.height
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: (0..<30).map { _ in Double.random(in: -100...100) })
    }
}
