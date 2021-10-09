//
//  BarChartBars.swift
//  
//
//  Created by Cameron Delong on 10/8/21.
//

import SwiftUI

struct BarChartBars: View {
    // MARK: Properties
    /// The data displayed.
    let data: [(value: Double, id: UUID)]
    
    /// The style defining the colors of the chart.
    let style: BarChartStyle
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    /// The space between each bar.
    var barSpacing: CGFloat {
        return 1 / CGFloat(data.count) * 90
    }
    
    /// The width of the bars in the chart.
    var barWidth: CGFloat {
        return min(size.width / CGFloat(data.count) - barSpacing, 100)
    }
    
    /// The min and max values of the data.
    var bounds: (min: Double, max: Double) {
        let values = data.map(\.value)
        return (values.min() ?? 0, values.max() ?? 0)
    }
    
    // MARK: Body
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(alignment: .bottom, spacing: barSpacing) {
                ForEach(data, id: \.id) { bar in
                    CustomRoundedRectangle(cornerRadius: 3, corners: [.topLeft, .topRight])
                        .fill(LinearGradient(gradient: Gradient(colors: [style.startColor, style.endColor]), startPoint: .bottom, endPoint: .top))
                        .frame(width: barWidth, height: abs(getHeight(value: bar.value)))
                        .scaleEffect(y: bar.value < 0 ? -1 : 1, anchor: .bottom)
                        .offset(y: getHeight(value: min(bounds.min, 0)))
                }
            }
            .frame(maxWidth: .infinity)
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: getHeight(value: max(bounds.max, 0))))
                path.addLine(to: CGPoint(x: size.width, y: getHeight(value: max(bounds.max, 0))))
            }
            .stroke(Color(.systemGray3), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
        }
        .readSize($size)
    }
    
    // MARK: Methods
    /// Returns the height of a bar based on its value.
    func getHeight(value: Double) -> CGFloat {
        return value / (max(bounds.max, 0) - min(bounds.min, 0)) * size.height
    }
}
