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
        VStack {
            ChartView(yAxisLabels: 3) {
                BarChart(data: [1,2,3,4,5])
                
                LineChart(data: [5,4,3,2,1])
            }
        }
    }
}
