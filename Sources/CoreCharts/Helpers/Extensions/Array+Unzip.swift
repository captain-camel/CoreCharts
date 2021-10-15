//
//  File.swift
//  
//
//  Created by Cameron Delong on 10/13/21.
//

extension Array {
    /// Transforms an array of tuples into 2 arrays.
    func unzip<First, Second>() -> ([First], [Second]) where Element == (First, Second) {
        let first = map { $0.0 }
        let second = map { $0.1 }
        
        return (first, second)
    }
}
