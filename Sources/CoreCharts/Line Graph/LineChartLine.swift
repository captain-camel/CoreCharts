//
//  LineChartLine.swift
//
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// The line showing the data on a `LineChart`.
@available(iOS 13.0, macOS 10.15, *)
struct LineChartLine: View {
    // MARK: Properties
    /// The data displayed.
    let data: [Double]
    
    /// The bounding rectangle of the view.
    @Binding var frame: CGRect
    
    /// Whether the line should be curved.
    var curved: Bool = true
    
    /// The space between 2 data points horizontally.
    var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        
        return frame.size.width / CGFloat(data.count - 1)
    }
    
    /// The vertical length of a different of 1 in the data.
    var stepHeight: CGFloat {
        guard let min = data.min() else { return 0 }
        guard let max = data.max() else { return 0 }
        
        return frame.size.height / (max - min)
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
            closedPath
                .fill(RadialGradient(colors: [Color(red: 168/255, green: 255/255, blue: 255/255), .white], center: .bottom, startRadius: 120, endRadius: 200))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .opacity(0.4)
            
            linePath
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 123/255, green: 117/255, blue: 255/255), Color(red: 111/255, green: 234/255, blue: 255/255)]), startPoint: .leading, endPoint: .trailing) ,style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
        }
    }
}
