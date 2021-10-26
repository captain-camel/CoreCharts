//
//  ChartView.swift
//  
//
//  Created by Cameron Delong on 10/10/21.
//

import SwiftUI

/// A view that can display multiple charts.
public struct ChartView<Content: View>: View {
    // MARK: Properties
    /// The number of horizontal lines the chart shows.
    var yAxisLabels: Int = 5
    
    /// The charts in the view.
    @ChartBuilder var content: Content
    
    // MARK: Initializers
    public init(yAxisLabels: Int = 5, @ChartBuilder content: () -> Content) {
        self.yAxisLabels = yAxisLabels
        self.content = content()
    }
    
    // MARK: Body
    public var body: some View {
        content
            .yAxisLabels(yAxisLabels)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView {
            BarChart(data: [1,2,3,4,5])
            
            LineChart(data: [5,4,3,2,1])
        }
    }
}
