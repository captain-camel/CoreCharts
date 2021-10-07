//
//  LineChartBackground.swift
//  
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// The background of a `LineChart`.
@available(iOS 13.0, macOS 10.15, *)
struct LineChartBackground: View {
    // MARK: Properties
    /// The data displayed.
    let data: [Double]
    
    /// The bounding rectangle of the view.
    @Binding var frame: CGRect
    
    /// The space between 2 data points horizontally.
    var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.count - 1)
    }
    
    /// The vertical length of a different of 1 in the data.
    var stepHeight: CGFloat {
        if let min = data.min(), let max = data.max(), min != max {
            return (frame.size.height) / CGFloat(max - min)
        }
        
        return 0
    }
    
    /// The labels on the y axis.
    var yAxisLabels: [Double] {
        guard let min = data.min() else { return [0, 0, 0, 0, 0] }
        guard let max = data.max() else { return [0, 0, 0, 0, 0] }
        
        var labels: [Double] = []
        
        for row in (0..<5).reversed() {
            labels.append(CGFloat(row) * ((max - min) / 4) + (data.min() ?? 0))
        }
        
        return labels
    }
    
    /// The positions of the labels on the y axis.
    var yAxisPoints: [CGFloat] {
        var points: [CGFloat] = []
        
        for row in 0..<5 {
            points.append((frame.height/4) * CGFloat(row))
        }
        
        return points
    }
    
    // MARK: Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(0..<5, id: \.self) { row in
                HStack(alignment: .center) {
                    Text(String(format: "%.2f", yAxisLabels[row]))
                        .offset(x: 0, y: yAxisPoints[row] - frame.height / 2)
                        .foregroundColor(Color(.systemGray4))
                        .font(.caption)
                    
                    Path { path in
                        path.move(to: CGPoint(x: 5, y: yAxisPoints[row]))
                        path.addLine(to: CGPoint(x: frame.width, y: yAxisPoints[row]))
                    }
                    .stroke(Color(.systemGray4), style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [5, 10]))
                    .clipped()
                }
            }
        }
    }
}
