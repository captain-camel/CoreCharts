//
//  ScatterPlot.swift
//  
//
//  Created by Cameron Delong on 10/16/21.
//

import SwiftUI

/// A chart showing a number of points at specific positions.
public struct ScatterPlot: Chart {
    // MARK: Properties
    /// The points displayed.
    var data: [CGPoint]
    
    /// The min and max values of the data.
    var bounds: ClosedRange<Double>
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String = "%.2f"
    
    /// The position of the Y axis labels.
    var yAxisLabelsPosition: YAxisLabelPosition = .left
    
    /// The color of the labels corresponding to the chart.
    var labelColor: Color = .blue
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between 2 data points horizontally.
    private var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        
        return size.width / (data.map(\.x).max()! - data.map(\.x).min()!)
    }
    
    /// The vertical length of a different of 1 in the data.
    private var stepHeight: CGFloat {
        size.height / (bounds.upperBound - bounds.lowerBound)
    }
    
    // MARK: Initializers
    public init(data: [CGPoint]) {
        self.data = data
        self.bounds = (data.map(\.y).min() ?? 0)...(data.map(\.y).max() ?? 0)
    }
    
    // MARK: Body
    public var body: some View {
        ZStack(alignment: .topLeading) {
            Path { path in
                for point in data {
                    path.addEllipse(in: CGRect(
                        x: point.x * stepWidth - 5,
                        y: (((data.map(\.y).max() ?? 0) - point.y) * stepHeight) - 5,
                        width: 10, height: 10
                    ))
                }
            }
            .offset(y: (bounds.upperBound - (data.map(\.y).max() ?? 0)) * stepHeight)
        }
        .readSize($size)
    }
}

struct ScatterPlot_Previews: PreviewProvider {
    static var previews: some View {
        ChartView {
            ScatterPlot(data: [CGPoint(x: 0, y: -7), CGPoint(x: 1, y: 5), CGPoint(x: 2, y: 5), CGPoint(x: 3, y: 3)])
        }
    }
}
