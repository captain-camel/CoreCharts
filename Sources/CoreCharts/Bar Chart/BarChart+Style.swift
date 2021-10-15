//
//  BarChartStyle.swift
//  
//
//  Created by Cameron Delong on 10/9/21.
//

import SwiftUI

extension BarChart {
    /// A style that determines the colors of a bar chart.
    public struct Style {
        // MARK: Properties
        /// A blue/purple gradient.
        public static let blue = Self(
            startColor: Color(red: 115/255, green: 143/255, blue: 247/255),
            endColor: Color(red: 122/255, green: 202/255, blue: 245/255),
            labelColor: .blue
        )
        
        /// An orange/red gradient.
        public static let orange = Self(
            startColor: Color(red: 237/255, green: 74/255, blue: 9/255),
            endColor: Color(red: 255/255, green: 150/255, blue: 95/255),
            labelColor: .blue
        )
        
        /// A green gradient.
        public static let green = Self(
            startColor: Color(red: 173/255, green: 229/255, blue: 164/255),
            endColor: Color(red: 200/255, green: 235/255, blue: 130/255),
            labelColor: .blue
        )
        
        /// A green gradient.
        public static let purple = Self(
            startColor: Color(red: 170/255, green: 190/255, blue: 235/255),
            endColor: Color(red: 242/255, green: 200/255, blue: 234/255),
            labelColor: .blue
        )
        
        /// A blue/green gradient.
        public static let teal = Self(
            startColor: Color(red: 145/255, green: 220/255, blue: 240/255),
            endColor: Color(red: 161/255, green: 243/255, blue: 186/255),
            labelColor: .blue
        )
        
        /// The first color of the line.
        public var startColor: Color
        /// The second color of the line.
        public var endColor: Color
        
        /// The color of the labels corresponding to the chart.
        var labelColor: Color
    }
}
