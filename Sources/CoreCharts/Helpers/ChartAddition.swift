//
//  ChartAddition.swift
//  
//
//  Created by Cameron Delong on 10/27/21.
//

import SwiftUI

/// Combines 2 `Chart`s into one with a shared background.
public func + <C0: Chart, C1: Chart>(lhs: C0, rhs: C1) -> some View {
    ChartView {
        lhs
        
        rhs
    }
}

struct ChartAddition_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(data: [1, 2, 3])
            .style(.orangeGlow) +
        LineChart(data: [3, 1, 2])
    }
}
