//
//  File.swift
//  
//
//  Created by Cameron Delong on 10/17/21.
//

extension Sequence where Element: AdditiveArithmetic {
    /// Returns the sum of the numbers in the `Sequence`.
    var sum: Element {
        reduce(.zero, +)
    }
}
