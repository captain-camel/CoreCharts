//
//  LineChart.swift
//
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// A line chart that displays an array of `Double`s.
///
/// Shows a line going through each data point.
/// Should be used inside of a `ChartView`.
public struct LineChart: Chart {
    // MARK: Properties
    /// The system color scheme.
    @Environment(\.colorScheme) var colorScheme
    
    /// The data displayed.
    let data: [Double]
    
    /// The style defining the colors of the chart.
    private var style: Style = .blue
    
    /// Whether the gradient under the chart is displayed.
    private var showGradient = true
    
    /// Whether the chart's line is curved.
    private var curved = false
    
    /// The min and max values of the data.
    var bounds: ClosedRange<Double>
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String = "%.2f"
    
    /// The position of the Y axis labels.
    var yAxisLabelsPosition: YAxisLabelPosition = .left
    
    /// The color of the labels corresponding to the chart.
    var labelColor: Color { style.startColor }
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between 2 data points horizontally.
    private var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        
        return size.width / CGFloat(data.count - 1)
    }
    
    /// The vertical length of a different of 1 in the data.
    private var stepHeight: CGFloat {
        size.height / (bounds.upperBound - bounds.lowerBound)
    }
    
    /// The `Path` of the line showing the data.
    private var linePath: Path {
        curved ? Path.quadCurvedPathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight)) : Path.linePathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight))
    }
    
    /// The `Path` of the space beneath the line showing the data.
    private var closedPath: Path {
        curved ? Path.quadClosedCurvedPathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight)) : Path.closedLinePathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight))
    }
    
    // MARK: Initializers
    public init(data: [Double]) {
        self.data = data
        self.bounds = (data.min() ?? 0)...(data.max() ?? 0)
    }
    
    // MARK: Body
    public var body: some View {
        ZStack {
            Group {
                if showGradient {
                    closedPath
                        .fill(
                            LinearGradient(
                                colors: [colorScheme == .light ? style.gradientColor : style.unwrappedDarkModeGradientColor, Color(.systemBackground)],
                                startPoint: UnitPoint(x: 0, y: 0),
                                endPoint: UnitPoint(x: 0, y: (data.range * stepHeight) / size.height)
                            )
                        )
                    
                    closedPath
                        .fill(
                            LinearGradient(
                                stops: [Gradient.Stop(color: Color(.systemBackground), location: 0),
                                        Gradient.Stop(color: Color(.systemBackground).opacity(0), location: 0.05),
                                        Gradient.Stop(color: Color(.systemBackground).opacity(0), location: 0.95),
                                        Gradient.Stop(color: Color(.systemBackground), location: 1)],
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 1)
                            )
                        )
                }
                
                linePath
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [style.startColor, style.endColor]),
                            startPoint: .leading, endPoint: .trailing
                        ),
                        style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round)
                    )
                    .shadow(color: style.glowColor, radius: 5)
            }
            .offset(y: (bounds.upperBound - (data.max() ?? 0)) * stepHeight)
        }
        .readSize($size)
    }
    
    // MARK: Methods
    /// Sets the bounds that the chart should scale itself in.
    func bounds(_ bounds: ClosedRange<Double>) -> Self {
        var newView = self
        newView.bounds = bounds
        return newView
    }
    
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
    public func gradientColor(_ color: Color) -> Self {
        var newView = self
        newView.style.gradientColor = color
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
    
    /// Sets the `String` specifier for displaying the `Chart`'s labels.
    public func labels(position: YAxisLabelPosition, specifier: String = "%.2f") -> Self {
        var newView = self
        newView.yAxisLabelsPosition = position
        newView.specifier = specifier
        return newView
    }
}
