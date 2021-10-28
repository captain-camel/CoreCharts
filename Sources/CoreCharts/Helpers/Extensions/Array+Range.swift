//
//  File.swift
//  
//
//  Created by Cameron Delong on 10/12/21.
//

extension Array where Element: AdditiveArithmetic & Comparable {
    /// The range of the `Array`, i.e. `max - min`.
    var range: Element {
        (self.max() ?? .zero) - (self.min() ?? .zero)
    }
}
