//
//  BarChartView.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// A bar chart to display data.
public struct BarChartView: View {
    // MARK: Properties
    /// The data displayed.
    private let data: [(label: String?, value: Double)]
    
    /// The style defining the colors of the chart.
    private var style: BarChartStyle = .blue
    
    /// The number of horizontal lines the chart shows.
    private var horizontalLines = 5
    
    // MARK: Initializers
    /// Creates a bar chart from an array of `Double`s.
    public init(data: [Double]) {
        self.data = data.map { (nil, $0) }
    }
    
    /// Creates a bar chart with labels.
    public init(data: [(label: String?, value: Double)]) {
        self.data = data
    }
    
    // MARK: Body
    public var body: some View {
        HStack {
            ChartYAxisLabels(
                bounds: (min: data.map(\.value).min() ?? 0,
                         max: data.map(\.value).max() ?? 0),
                labels: horizontalLines
            )
            
            ZStack(alignment: .bottom) {
                ChartBackground(horizontalLines: horizontalLines)
                
                BarChart(data: data.map(\.value))
            }
        }
        .frame(height: 240)
    }
    
    // MARK: Methods
    /// Sets the style of the chart.
    public func style(_ style: BarChartStyle) -> Self {
        var newView = self
        newView.style = style
        return newView
    }
    
    /// Sets the number of horizontal lines in the background of the chart.
    public func horizontalLines(_ lines: Int) -> Self {
        var newView = self
        newView.horizontalLines = lines
        return newView
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(data: [20, 10, 41, -1, -76, -50, 44, 31, -66, 40, 40, 70, -70, -54, -30, -30, -60, -67, -20, 53, 87, 63, 70, -25, -65, -11, -40, -60, -14, -64])
            .style(.orange)
            .padding()
    }
}
