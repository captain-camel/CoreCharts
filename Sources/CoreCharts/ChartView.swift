//
//  ChartView.swift
//  
//
//  Created by Cameron Delong on 10/10/21.
//

import SwiftUI
import Accelerate

/// A view that can display multiple charts.
public struct ChartView<Content: View>: View {
    // MARK: Properties
    /// The number of horizontal lines the chart shows.
    var yAxisLabels: Int = 5
    
    /// The charts in the view.
    @ChartBuilder var content: Content
    
    // MARK: Body
    public var body: some View {
        content
            .yAxisLabels(yAxisLabels)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView {
            LineChart(data: [20, 21, 41, 65, 76, 60, 64, 61, 66, 64, 62, 67, 67, 54, 3, 10, 6, 67, 2, 53, 87, 63, 7, 25, 65, 11, 2, 6, 14, 64, 5, 5, 5, 4, 3, 2, 41, 64])
                .style(.orange)
            BarChart(data: [1,2,3,4,5,4,3,2,1,0,-1,-2,-3])
                .style(.orange)
        }
        .padding()
        .preferredColorScheme(.some(.dark))
    }
}
