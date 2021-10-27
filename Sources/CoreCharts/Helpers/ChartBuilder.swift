//
//  ChartBuilder.swift
//  
//
//  Created by Cameron Delong on 10/9/21.
//

import SwiftUI

/// A `resultBuilder` to create complex multi-layer charts.
@resultBuilder public struct ChartBuilder {
    /// Builds a view with no charts.
    static func buildBlock() -> some View {
        HStack {
            ChartYAxisLabels(bounds: 0...1)
            
            ChartBackground()
        }
    }
    
    /// Builds a view with 1 chart.
    static func buildBlock<C0: Chart>(_ c0: C0) -> some View {
        buildBlock(from: [c0]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 2 charts.
    static func buildBlock<C0: Chart, C1: Chart>(_ c0: C0, _ c1: C1) -> some View {
        buildBlock(from: [c0, c1]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 3 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart>(_ c0: C0, _ c1: C1, _ c2: C2) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 4 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 5 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart, C4: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c4
                .bounds((c4.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 6 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart, C4: Chart, C5: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c4
                .bounds((c4.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c5
                .bounds((c5.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 7 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart, C4: Chart, C5: Chart, C6: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c4
                .bounds((c4.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c5
                .bounds((c5.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c6
                .bounds((c6.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 8 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart, C4: Chart, C5: Chart, C6: Chart, C7: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c4
                .bounds((c4.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c5
                .bounds((c5.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c6
                .bounds((c6.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c7
                .bounds((c7.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 9 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart, C4: Chart, C5: Chart, C6: Chart, C7: Chart, C8: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c4
                .bounds((c4.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c5
                .bounds((c5.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c6
                .bounds((c6.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c7
                .bounds((c7.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c8
                .bounds((c8.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// Builds a view with 10 charts.
    static func buildBlock<C0: Chart, C1: Chart, C2: Chart, C3: Chart, C4: Chart, C5: Chart, C6: Chart, C7: Chart, C8: Chart, C9: Chart>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some View {
        buildBlock(from: [c0, c1, c2]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c2
                .bounds((c2.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c3
                .bounds((c3.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c4
                .bounds((c4.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c5
                .bounds((c5.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c6
                .bounds((c6.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c7
                .bounds((c7.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c8
                .bounds((c8.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
            c9
                .bounds((c9.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
                .showBackground(false)
        }
    }
    
    /// A helper method for other `buildBlock` methods.
    private static func buildBlock<Content: View>(from components: [ChartData], @ViewBuilder content: (_ leftLabelBounds: ClosedRange<Double>?, _ rightLabelBounds: ClosedRange<Double>?) -> Content) -> some View {
        
        let leftLabelBoundsArrays = components.filter { $0.yAxisLabelsPosition == .left }.map(\.bounds).map { ($0.lowerBound, $0.upperBound) }.unzip()
        let leftLabelBounds: ClosedRange<Double>?
        
        if let min = leftLabelBoundsArrays.0.min(), let max = leftLabelBoundsArrays.1.max() {
            if max == min {
                leftLabelBounds = (min - 1)...(max + 1)
            } else {
                leftLabelBounds = min...max
            }
        } else {
            leftLabelBounds = nil
        }
        
        let rightLabelBoundsArrays = components.filter { $0.yAxisLabelsPosition == .right }.map(\.bounds).map { ($0.lowerBound, $0.upperBound) }.unzip()
        let rightLabelBounds: ClosedRange<Double>?
        
        if let min = rightLabelBoundsArrays.0.min(), let max = rightLabelBoundsArrays.1.max() {
            if max == min {
                rightLabelBounds = (min - 1)...(max + 1)
            } else {
                rightLabelBounds = min...max
            }
        } else {
            rightLabelBounds = nil
        }
        
        return HStack {
            if let bounds = leftLabelBounds {
                ChartYAxisLabels(
                    bounds: bounds,
                    color: components.filter { $0.yAxisLabelsPosition == .left }.count == 1 && components.count != 1
                    ? components.filter { $0.yAxisLabelsPosition == .left }.first!.yAxisLabelColor
                    : Color(.systemGray),
                    specifier: components.first { $0.yAxisLabelsPosition == .left }?.specifier ?? "%.2f"
                )
            }
            
            ZStack(alignment: .bottom) {
                ChartBackground()
                
                content(leftLabelBounds, rightLabelBounds)
            }
            
            if let bounds = rightLabelBounds {
                ChartYAxisLabels(
                    bounds: bounds,
                    color: components.filter { $0.yAxisLabelsPosition == .right }.count == 1 && components.count != 1
                    ? components.filter { $0.yAxisLabelsPosition == .right }.first!.yAxisLabelColor
                    : Color(.systemGray),
                    specifier: components.first { $0.yAxisLabelsPosition == .right }?.specifier ?? "%.2f"
                )
            }
        }
        .frame(height: 240)
    }
}
