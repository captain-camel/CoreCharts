//
//  BarChart.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// A bar chart to display data.
public struct BarChart: View {
    // MARK: Properties
    /// The data displayed.
    private let data: [(label: String?, value: Double, id: UUID)]
    
    /// The style defining the colors of the chart.
    private var style: BarChartStyle = .blue
    
    /// The number of horizontal lines the chart shows.
    private var horizontalLines = 5
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    // MARK: Initializers
    /// Creates a bar chart from an array of `Double`s.
    public init(data: [Double]) {
        self.data = data.map { (nil, $0, UUID()) }
    }
    
    /// Creates a bar chart with labels.
    public init(data: [(label: String?, value: Double)]) {
        self.data = data.map { ($0.label, $0.value, UUID()) }
    }
    
    // MARK: Body
    public var body: some View {
        HStack {
            ChartYAxisLabels(data: data.map(\.value), horizontalLines: horizontalLines)
            
            ZStack(alignment: .bottom) {
                ChartBackground(horizontalLines: horizontalLines)
                    .frame(height: 240)
                
                BarChartBars(data: data.map { ($0.value, UUID()) }, style: style)
            }
        }
        .frame(height: 240)
        .readSize($size)
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

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: [20, 10, 41, -1, -76, -50, 44, 31, -66, 40, 40, 70, -70, -54, -30, -30, -60, -67, -20, 53, 87, 63, 70, -25, -65, -11, -40, -60, -14, -64])
            .style(.orange)
            .padding()
    }
}
