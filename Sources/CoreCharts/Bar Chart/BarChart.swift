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
    var style: Style = .blue
    
    /// The min and max values of the data.
    var bounds: ClosedRange<Double>
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String = "%.2f"
    
    /// The position of the Y axis labels.
    var yAxisLabelsPosition: YAxisLabelPosition = .left
    
    /// The color of the labels corresponding to the chart.
    var yAxisLabelColor: Color { style.labelColor }
    
    /// Whether to display the background of the chart.
    var showBackground = true
    
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
    /// Creates a bar chart from an array of `Double`s
    ///
    /// - Parameter data: The data to display.
    public init(data: [Double]) {
        self.data = data
        self.bounds = min(data.min() ?? 0, 0)...max(data.max() ?? 0, 0)
    }
    
    // MARK: Body
    /// The bar chart with no background.
    var content: some View {
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
