//
//  LineChart.swift
//
//
//  Created by Cameron Delong on 10/5/21.
//

import SwiftUI

/// A line graph to display data.
@available(iOS 13.0, macOS 10.15, *)
public struct LineChart: View {
    // MARK: Properties
    /// The data displayed.
    let data: [Double]
    
    // MARK: Body
    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                LineChartBackground(data: self.data, frame: .constant(geometry.frame(in: .local)))
                
                LineChartLine(data: self.data, frame: .constant(CGRect(x: 0, y: 0, width: geometry.frame(in: .local).width - 40, height: geometry.frame(in: .local).height)))
                    .offset(x: 40, y: 0)
            }
        }
        .frame(height: 240)
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(data: [21, 41, 65, 76, -5, -44, 31, 66, 4, 2, 7, 7, 54, 3, 10, 6, -67, -2, 53, 87, 63, 77, 25, 65, 11, 2, 6, 14, 64])
            .padding()
    }
}

