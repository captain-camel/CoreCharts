//
//  BarChart.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// A bar chart to display data.
public struct BarChart: View {
    // MARK: Properties
    /// The data displayed.
    let data: [(label: String?, value: Double, id: UUID)]
    
    /// The size of the view.
    @State private var size = CGSize.zero
    
    // MARK: Initializers
    /// Creates a bar chart from an array of `Double`s.
    public init(data: [Double]) {
        self.data = data.map { (nil, $0, UUID()) }
    }
    
    /// Creates a bar chart with labels.
    public init(data: [(label: String?, value: Double)]) {
        self.data = data.map { ($0.label, $0.value, UUID()) }
    }
    
    // MARK: Body
    public var body: some View {
        ZStack(alignment: .bottom) {
            LineChartBackground(horizontalLines: 5)
                .frame(height: 240)
            
            BarChartBars(data: data.map { ($0.value, UUID()) })
        }
        .frame(height: 240)
        .readSize($size)
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: [-20, -10, -41, -65, -76, -50, -44, -31, -66, -40, -40, -70, -70, -54, -30, -30, -60, -67, -20, -53, 87, -63, -70, -25, -65, -11, -40, -60, -14, -64])
            .padding()
    }
}
