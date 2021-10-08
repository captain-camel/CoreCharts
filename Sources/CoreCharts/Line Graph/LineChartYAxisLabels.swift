//
//  LineChartYAxisLabels.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// The labels on the Y axis of a `LineChart`.
struct LineChartYAxisLabels: View {
    // MARK: Properties
    /// The data displayed.
    let data: [Double]
    
    /// The height of the view.
    let height: CGFloat
    
    /// The number of horizontal lines the chart shows.
    var horizontalLines: Int
    
    /// The labels on the y axis.
    var yAxisLabels: [Double] {
        guard let min = data.min() else { return Array(repeating: 0, count: horizontalLines) }
        guard let max = data.max() else { return Array(repeating: 0, count: horizontalLines) }
        
        var labels: [Double] = []
        
        for row in (0..<horizontalLines).reversed() {
            labels.append(CGFloat(row) * ((max - min) / Double(horizontalLines - 1)) + (data.min() ?? 0))
        }
        
        return labels
    }
    
    /// The positions of the labels on the y axis.
    var yAxisPoints: [CGFloat] {
        var points: [CGFloat] = []
        
        for row in 0..<horizontalLines {
            points.append((height / CGFloat(horizontalLines - 1)) * CGFloat(row))
        }
        
        return points
    }
    
    // MARK: Body
    var body: some View {
        ForEach(0..<horizontalLines, id: \.self) { row in
            Text(String(format: "%.2f", yAxisLabels[row]))
                .offset(y: yAxisPoints[row] - height / 2)
                .foregroundColor(Color(.systemGray4))
                .font(.caption)
        }
    }
}
