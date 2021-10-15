//
//  ChartBuilder.swift
//  
//
//  Created by Cameron Delong on 10/9/21.
//

import SwiftUI

/// A `resultBuilder` to create complex charts.
@resultBuilder struct ChartBuilder {
    /// Builds a view with 1 chart.
    static func buildBlock<C0: Chart>(_ c0: C0) -> some View {
//        @Environment(\.yAxisLabels) var yAxisLabels: Int
//
//        return HStack {
//            ChartYAxisLabels(bounds: c0.bounds.lowerBound...c0.bounds.upperBound)
//
//            ZStack(alignment: .bottom) {
//                ChartBackground()
//
//                c0
//            }
//        }
//        .frame(height: 240)
        buildBlock(from: [c0]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
        }
    }
    
    /// Builds a view with 2 charts.
    static func buildBlock<C0: Chart, C1: Chart>(_ c0: C0, _ c1: C1) -> some View {
        buildBlock(from: [c0, c1]) { leftLabelBounds, rightLabelBounds in
            c0
                .bounds((c0.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
            c1
                .bounds((c1.yAxisLabelsPosition == .left ? leftLabelBounds : rightLabelBounds)!)
        }
    }
    
    fileprivate static func buildBlock<Content: View>(from components: [ChartData], @ViewBuilder content: (_ leftLabelBounds: ClosedRange<Double>?, _ rightLabelBounds: ClosedRange<Double>?) -> Content) -> some View {
        
        let leftLabelBoundsArrays = components.filter { $0.yAxisLabelsPosition == .left }.map(\.bounds).map { ($0.lowerBound, $0.upperBound) }.unzip()
        let leftLabelBounds: ClosedRange<Double>?
        
        if let min = leftLabelBoundsArrays.0.min(), let max = leftLabelBoundsArrays.1.max() {
            leftLabelBounds = min...max
        } else {
            leftLabelBounds = nil
        }
        
        let rightLabelBoundsArrays = components.filter { $0.yAxisLabelsPosition == .right }.map(\.bounds).map { ($0.lowerBound, $0.upperBound) }.unzip()
        let rightLabelBounds: ClosedRange<Double>?
        
        if let min = rightLabelBoundsArrays.0.min(), let max = rightLabelBoundsArrays.1.max() {
            rightLabelBounds = min...max
        } else {
            rightLabelBounds = nil
        }
        
        return HStack {
            if let bounds = leftLabelBounds {
//                if components.filter { $0.yAxisLabelsPosition == .left }.count == 1 {
//                    ChartYAxisLabels(
//                        bounds: bounds,
//                        color: components.filter { $0.yAxisLabelsPosition == .left }.first!.labelColor
//                    )
//                } else {
//                    ChartYAxisLabels(bounds: bounds)
//                }
                ChartYAxisLabels(
                    bounds: bounds,
                    color: components.filter { $0.yAxisLabelsPosition == .left }.count == 1
                    ? components.filter { $0.yAxisLabelsPosition == .left }.first!.labelColor
                    : Color(.systemGray),
                    specifier: components.first { $0.yAxisLabelsPosition == .left }?.specifier ?? "%.2f"
                )
            }
            
            ZStack(alignment: .bottom) {
                ChartBackground()
                
                content(leftLabelBounds, rightLabelBounds)
            }
            
            if let bounds = rightLabelBounds {
//                if components.filter { $0.yAxisLabelsPosition == .right }.count == 1 {
//                    ChartYAxisLabels(
//                        bounds: bounds,
//                        color: components.filter { $0.yAxisLabelsPosition == .right }.first!.labelColor
//                    )
//                } else {
//                    ChartYAxisLabels(bounds: bounds)
//                }
                ChartYAxisLabels(
                    bounds: bounds,
                    color: components.filter { $0.yAxisLabelsPosition == .right }.count == 1
                    ? components.filter { $0.yAxisLabelsPosition == .right }.first!.labelColor
                    : Color(.systemGray),
                    specifier: components.first { $0.yAxisLabelsPosition == .right }?.specifier ?? "%.2f"
                )
            }
        }
        .frame(height: 240)
    }
}

private struct YAxisLabels: EnvironmentKey {
    static let defaultValue: Int = 7
}

extension EnvironmentValues {
    var yAxisLabels: Int {
        get { self[YAxisLabels.self] }
        set { self[YAxisLabels.self] = newValue }
    }
}

extension View {
    func yAxisLabels(_ yAxisLabels: Int) -> some View {
        environment(\.yAxisLabels, yAxisLabels)
    }
}
