//
//  LineChartYAxisLabels.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// The labels on the Y axis of a chart.
struct ChartYAxisLabels: View {
    // MARK: Properties
    /// The number labels on the Y axis.
    @Environment(\.yAxisLabels) var labels
    
    /// The lower and upper bound of the data.
    let bounds: ClosedRange<Double>
    
    /// The color of the labels.
    var color: Color = Color(.systemGray)
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String = "%.2f"
    
    /// The size of the view.
    @State var size = CGSize.zero
    
    /// The labels on the Y axis.
    var yAxisLabels: [Double] {
        var labelValues: [Double] = []
        
        for row in (0..<labels).reversed() {
            labelValues.append(CGFloat(row) * ((bounds.upperBound - bounds.lowerBound) / Double(labels - 1)) + bounds.lowerBound)
        }
        
        return labelValues
    }
    
    /// The positions of the labels on the Y axis.
    var yAxisPoints: [CGFloat] {
        var points: [CGFloat] = []
        
        for row in 0..<labels {
            points.append((size.height / CGFloat(labels - 1)) * CGFloat(row))
        }
        
        return points
    }
    
    // MARK: Body
    var body: some View {
        ZStack(alignment: .trailing) {
            ForEach(0..<labels, id: \.self) { row in
                Text(String(format: specifier, yAxisLabels[row]))
                    .offset(y: yAxisPoints[row] - size.height / 2)
                    .foregroundColor(color)
                    .font(.caption)
            }
        }
        .frame(maxHeight: .infinity)
        .readSize($size)
    }
}
