//
//  File.swift
//  
//
//  Created by Cameron Delong on 10/12/21.
//

extension Array where Element: AdditiveArithmetic & ExpressibleByIntegerLiteral, Element: Comparable {
    /// The range of the `Array`, i.e. `max - min`.
    var range: Element {
        return (self.max() ?? 0) - (self.min() ?? 0)
    }
}
