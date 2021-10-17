//
//  BarChart.swift
//  
//
//  Created by Cameron Delong on 10/8/21.
//

import SwiftUI

/// A bar chart that displays an array of `Double`s.
///
/// Shows a bar for each data point.
/// Should be used inside of a `ChartView`.
public struct BarChart: Chart {
    // MARK: Properties
    /// The data displayed.
    private let data: [Double]
    
    /// The style defining the colors of the chart.
    private var style: Style = .blue
    
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
    
    /// The space between each bar.
    private var barSpacing: CGFloat {
        1 / CGFloat(data.count) * 90
    }
    
    /// The width of the bars in the chart.
    private var barWidth: CGFloat {
        min(size.width / CGFloat(data.count) - barSpacing, 100)
    }
    
    // MARK: Initializers
    /// Creates a bar chart from an array of `Double`s
    /// 
    /// - Parameter data: The data to display.
    public init(data: [Double]) {
        self.data = data
        self.bounds = min(data.min() ?? 0, 0)...max(data.max() ?? 0, 0)
    }
    
    // MARK: Body
    public var body: some View {
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
            .zIndex(1000)
        }
        .readSize($size)
    }
    
    // MARK: Methods
    /// Returns the height of a bar based on its value.
    private func getHeight(value: Double) -> CGFloat {
        value / (max(bounds.upperBound, 0) - min(bounds.lowerBound, 0)) * size.height
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
    
    /// Sets the `String` specifier for displaying the `Chart`'s labels.
    public func labels(position: YAxisLabelPosition, specifier: String = "%.2f") -> Self {
        var newView = self
        newView.yAxisLabelsPosition = position
        newView.specifier = specifier
        return newView
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: [1,2,3,4,5,4,3,2,1])
    }
}
