//
//  File.swift
//  
//
//  Created by Cameron Delong on 10/20/21.
//

import SwiftUI

/// An `EnvironmentKey` storing the number of labels on the Y axis to show on some views.
private struct YAxisLabels: EnvironmentKey {
    /// The default value of the `EnvironmentKey`.
    static let defaultValue: Int = 5
}

extension EnvironmentValues {
    /// The value of `EnvironmentValue` `yAxisLabels`.
    var yAxisLabels: Int {
        get { self[YAxisLabels.self] }
        set { self[YAxisLabels.self] = newValue }
    }
}

extension View {
    /// Sets the number of Y axis labels on some views.
    func yAxisLabels(_ yAxisLabels: Int) -> some View {
        environment(\.yAxisLabels, yAxisLabels)
    }
}
