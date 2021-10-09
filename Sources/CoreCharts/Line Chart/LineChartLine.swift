//
//  LineChartLine.swift
//
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// The line showing the data on a `LineChart`.
struct LineChartLine: View {
    // MARK: Properties
    /// The data displayed.
    let data: [Double]
    
    /// The style defining the colors of the chart.
    var style: LineChartStyle
    
    /// Whether the gradient under the chart is displayed.
    var showGradient: Bool
    
    /// Whether the chart's line is curved.
    var curved: Bool
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between 2 data points horizontally.
    var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        
        return size.width / CGFloat(data.count - 1)
    }
    
    /// The vertical length of a different of 1 in the data.
    var stepHeight: CGFloat {
        guard let min = data.min() else { return 0 }
        guard let max = data.max() else { return 0 }
        
        return size.height / (max - min)
    }
    
    /// The `Path` of the line showing the data.
    var linePath: Path {
        return curved ? Path.quadCurvedPathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight)) : Path.linePathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight))
    }
    
    /// The `Path` of the space beneath the line showing the data.
    var closedPath: Path {
        return curved ? Path.quadClosedCurvedPathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight)) : Path.closedLinePathWithPoints(points: data, step: CGSize(width: stepWidth, height: stepHeight))
    }
    
    // MARK: Body
    public var body: some View {
        ZStack {
            if let gradientColor = style.gradientColor {
                closedPath
                    .fill(
                        RadialGradient(
                            colors: [gradientColor, .white],
                            center: .bottom,
                            startRadius: 120,
                            endRadius: 200
                        )
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .opacity(0.4)
            }
            
            linePath
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [style.startColor, style.endColor]),
                        startPoint: .leading, endPoint: .trailing
                    ),
                    style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round)
                )
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: style.glowColor ?? .clear, radius: 5)
        }
        .readSize($size)
    }
}
