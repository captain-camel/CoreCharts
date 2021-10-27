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
    var data: [(x: Double, y: Double)]
    
    /// The color of the points on the chart.
    var pointColor: Color = .secondary
    
    /// The color of the linear regression line.
    var regressionLineColor: Color = .blue
    
    /// The `StrokeStyle` of the line of best fit.
    var regressionLineStyle = StrokeStyle(lineWidth: 3, lineCap: .round)
    
    /// Whether to show the linear line of best fit of the data.
    var showRegressionLine = false
    
    /// The min and max values of the data.
    var bounds: ClosedRange<Double>
    
    /// The `String` specifier for displaying the `Chart`'s labels.
    var specifier: String = "%.2f"
    
    /// The position of the Y axis labels.
    var yAxisLabelsPosition: YAxisLabelPosition = .left
    
    /// The color of the labels corresponding to the chart.
    var yAxisLabelColor: Color = .blue
    
    /// Whether to display the background of the chart.
    var showBackground = true
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between 2 data points horizontally.
    private var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        
        if (data.map(\.x).max()! - data.map(\.x).min()!) == 0 {
            return 0
        }
        
        return size.width / (data.map(\.x).max()! - data.map(\.x).min()!)
    }
    
    /// The vertical length of a different of 1 in the data.
    private var stepHeight: CGFloat {
        if bounds.upperBound == bounds.lowerBound {
            return size.height / 2
        }
        
        return size.height / (bounds.upperBound - bounds.lowerBound)
    }
    
    /// The linear line of best fit of the data.
    private var regressionLine: (slope: Double, yIntercept: Double) {
        let meanX = data.map(\.x).sum / Double(data.count)
        let meanY = data.map(\.y).sum / Double(data.count)
        
        let rise = data.reduce(0) { $0 + ($1.x - meanX) * ($1.y - meanY) }
        let run = data.reduce(0) { $0 + pow($1.x - meanX, 2) }
        
        let slope: Double
        
        if run == 0 {
            slope = 0
        } else {
            slope = rise / run
        }
        
        let yIntercept = meanY - slope * meanX
        
        return (slope: slope, yIntercept: yIntercept)
    }
    
    // MARK: Initializers
    public init(data: [(x: Double, y: Double)]) {
        self.data = data
        self.bounds = (data.map(\.y).min() ?? 0)...(data.map(\.y).max() ?? 0)
    }
    
    // MARK: Body
    /// The scatter plot with no background.
    var content: some View {
        ZStack(alignment: .topLeading) {
            if showRegressionLine && data.count > 1 {
                Path { path in
                    let startingYValue = getRegressionLineY(at: data.map(\.x).min() ?? 0)
                    let startingPoint: CGPoint
                    
                    if bounds.contains(startingYValue) {
                        startingPoint = CGPoint(
                            x: 0,
                            y: ((data.map(\.y).max() ?? 0) - startingYValue) * stepHeight
                        )
                    } else if startingYValue > bounds.upperBound {
                        let startingXValue = getRegressionLineX(at: bounds.upperBound)
                        startingPoint = CGPoint(
                            x: (startingXValue - (data.map(\.x).min() ?? 0)) * stepWidth,
                            y: 0
                        )
                    } else {
                        let startingXValue = getRegressionLineX(at: bounds.lowerBound)
                        startingPoint = CGPoint(
                            x: (startingXValue - (data.map(\.x).min() ?? 0)) * stepWidth,
                            y: size.height - (bounds.upperBound - (data.map(\.y).max() ?? 0)) * stepHeight
                        )
                    }
                    
                    path.move(to: startingPoint)
                    
                    let endingYValue = regressionLine.slope * (data.map(\.x).max() ?? 0) + regressionLine.yIntercept
                    let endingPoint: CGPoint
                    
                    if bounds.contains(endingYValue) {
                        endingPoint = CGPoint(
                            x: size.width,
                            y: ((data.map(\.y).max() ?? 0) - endingYValue) * stepHeight
                        )
                    } else if endingYValue > bounds.upperBound {
                        let endingXValue = getRegressionLineX(at: bounds.upperBound)
                        endingPoint = CGPoint(
                            x: (endingXValue - (data.map(\.x).min() ?? 0)) * stepWidth,
                            y: 0
                        )
                    } else {
                        let endingXValue = getRegressionLineX(at: bounds.lowerBound)
                        endingPoint = CGPoint(
                            x: (endingXValue - (data.map(\.x).min() ?? 0)) * stepWidth,
                            y: size.height - (bounds.upperBound - (data.map(\.y).max() ?? 0)) * stepHeight
                        )
                    }
                    
                    path.addLine(to: endingPoint)
                }
                .stroke(regressionLineColor, style: regressionLineStyle)
                .offset(y: (bounds.upperBound - (data.map(\.y).max() ?? 0)) * stepHeight)
            }
            
            Path { path in
                for point in data {
                    path.addEllipse(in: CGRect(
                        x: point.x * stepWidth - 5,
                        y: (((data.map(\.y).max() ?? 0) - point.y) * stepHeight) - CGFloat(5),
                        width: 10, height: 10
                    ))
                }
            }
            .foregroundColor(pointColor)
            .offset(y: (bounds.upperBound - (data.map(\.y).max() ?? 0)) * stepHeight)
            .offset(x: -(data.map(\.x).min() ?? 0) * stepWidth)
        }
        .readSize($size)
    }
    
    private func getRegressionLineY(at x: Double) -> Double {
        x * regressionLine.slope + regressionLine.yIntercept
    }
    
    private func getRegressionLineX(at y: Double) -> Double {
        (y - regressionLine.yIntercept) / regressionLine.slope
    }
}

struct ScatterPlot_Previews: PreviewProvider {
    static var previews: some View {
        ScatterPlot(data: (0..<30).map { _ in (x: Double.random(in: -100...100), y: Double.random(in: -100...100)) })
            .showRegressionLine()
    }
}
