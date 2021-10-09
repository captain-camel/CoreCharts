//
//  LineChart.swift
//
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// A line chart to display data.
public struct LineChart: View {
    // MARK: Properties
    /// The data displayed.
    private let data: [Double]
    
    /// The style defining the colors of the chart.
    private var style: LineChartStyle = .blue
    
    /// Whether the gradient under the chart is displayed.
    private var showGradient = true
    
    /// Whether the chart's line is curved.
    private var curved = false
    
    /// The number of horizontal lines the chart shows.
    private var horizontalLines = 5
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    // MARK: Initializers
    /// Creates a line chart from an array of `Double`s.
    public init(data: [Double]) {
        self.data = data
    }
    
    // MARK: Body
    public var body: some View {
        HStack {
            ChartYAxisLabels(data: data, horizontalLines: horizontalLines)
            
            ZStack {
                ChartBackground(horizontalLines: horizontalLines)
                
                LineChartLine(
                    data: data,
                    style: style,
                    showGradient: showGradient,
                    curved: curved
                )
            }
            .readSize($size)
        }
        .frame(height: 240)
    }
    
    // MARK: Methods
    /// Sets the style of the chart.
    public func style(_ style: LineChartStyle) -> Self {
        var newView = self
        newView.style = style
        return newView
    }
    
    /// Sets the visibility of the gradient under the chart.
    public func showGradient(_ showGradient: Bool) -> Self {
        var newView = self
        newView.showGradient = showGradient
        return newView
    }
    
    /// Sets whether the line should be curved.
    public func curved(_ curved: Bool = true) -> Self {
        var newView = self
        newView.curved = curved
        return newView
    }
    
    /// Sets the number of horizontal lines in the background of the chart.
    public func horizontalLines(_ lines: Int) -> Self {
        var newView = self
        newView.horizontalLines = lines
        return newView
    }
    
    /// Sets the gradient color under the chart.
    public func gradientColor(_ color: Color?) -> Self {
        var newView = self
        newView.style.gradientColor = color
        return newView
    }
    
    /// Sets the glow color of the chart.
    public func glowColor(_ color: Color?) -> Self {
        var newView = self
        newView.style.glowColor = color
        return newView
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(data: [-20, 21, 41, 65, 76, -5, -44, 31, 66, 4, 2, 7, 7, 54, 3, 10, 6, -67, -2, 53, 87, 63, 7, 25, 65, 11, 2, 6, 14, 64, 5, 5, 5, 4, 3, 2, 41, 64])
            .curved()
            .padding()
    }
}
