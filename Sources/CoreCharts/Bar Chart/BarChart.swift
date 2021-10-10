//
//  BarChart.swift
//  
//
//  Created by Cameron Delong on 10/8/21.
//

import SwiftUI

public struct BarChart: View {
    // MARK: Properties
    /// The data displayed.
    let data: [(value: Double, id: UUID)]
    
    /// The style defining the colors of the chart.
    private var style: BarChartStyle = .blue
    
    /// The min and max values of the data.
    private var bounds: ClosedRange<Double>
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between each bar.
    private var barSpacing: CGFloat {
        return 1 / CGFloat(data.count) * 90
    }
    
    /// The width of the bars in the chart.
    private var barWidth: CGFloat {
        return min(size.width / CGFloat(data.count) - barSpacing, 100)
    }
    
    // MARK: Initializers
    public init(data: [Double]) {
        self.data = data.map { ($0, UUID()) }
        self.bounds = (data.min() ?? 0)...(data.max() ?? 0)
    }
    
    // MARK: Body
    public var body: some View {
        ZStack(alignment: .bottom) {
            HStack(alignment: .bottom, spacing: barSpacing) {
                ForEach(data, id: \.id) { bar in
                    CustomRoundedRectangle(cornerRadius: 3, corners: [.topLeft, .topRight])
                        .fill(LinearGradient(gradient: Gradient(colors: [style.startColor, style.endColor]), startPoint: .bottom, endPoint: .top))
                        .frame(width: barWidth, height: abs(getHeight(value: bar.value)))
                        .scaleEffect(y: bar.value < 0 ? -1 : 1, anchor: .bottom)
                        .offset(y: getHeight(value: min(bounds.lowerBound, 0)))
                }
            }
            .frame(maxWidth: .infinity)
            
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
        return value / (max(bounds.upperBound, 0) - min(bounds.lowerBound, 0)) * size.height
    }
    
    /// Sets the bounds that the chart should scale itself in.
    func bounds(_ bounds: ClosedRange<Double>) -> Self {
        var newView = self
        newView.bounds = bounds
        return newView
    }
    
    /// Sets the style of the chart.
    public func style(_ style: BarChartStyle) -> Self {
        var newView = self
        newView.style = style
        return newView
    }
}
