//
//  ChartBackground.swift
//  
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// The background of a chart.
struct ChartBackground: View {
    // MARK: Properties
    /// The number of horizontal lines the chart shows.
    @Environment(\.yAxisLabels) var yAxisLabels
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The positions of the lines.
    var yAxisPoints: [CGFloat] {
        var points: [CGFloat] = []
        
        for row in 0..<yAxisLabels {
            points.append((size.height / CGFloat(yAxisLabels - 1)) * CGFloat(row))
        }
        
        return points
    }
    
    // MARK: Body
    var body: some View {
        ForEach(0..<yAxisLabels, id: \.self) { row in
            HStack(alignment: .center) {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: yAxisPoints[row]))
                    path.addLine(to: CGPoint(x: size.width, y: yAxisPoints[row]))
                }
                .stroke(Color(.systemGray4), style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [5, 10]))
            }
            .if(row == yAxisLabels - 1) { view in
                view.zIndex(1)
            }
        }
        .readSize($size)
    }
}
