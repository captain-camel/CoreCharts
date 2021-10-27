//
//  LineChartStyle.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

extension LineChart {
    /// A style that determines the colors of a line chart.
    public struct Style {
        // MARK: Properties
        /// A blue/purple gradient.
        public static let blue = Self(
            startColor: Color(red: 120/255, green: 120/255, blue: 255/255),
            endColor: Color(red: 110/255, green: 235/255, blue: 255/255),
            gradientColor: Color(red: 170/255, green: 255/255, blue: 255/255),
            glowColor: .clear,
            labelColor: .blue
        )
        
        /// An orange/red gradient.
        public static let orange = Self(
            startColor: Color(red: 237/255, green: 74/255, blue: 9/255),
            endColor: Color(red: 255/255, green: 150/255, blue: 95/255),
            gradientColor: Color(red: 255/255, green: 190/255, blue: 160/255),
            glowColor: .clear,
            labelColor: .blue
        )
        
        /// A green gradient.
        public static let green = Self(
            startColor: Color(red: 50/255, green: 130/255, blue: 50/255),
            endColor: Color(red: 120/255, green: 230/255, blue: 150/255),
            gradientColor: Color(red: 181/255, green: 255/255, blue: 182/255),
            glowColor: .clear,
            labelColor: .blue
        )
        
        /// A blue/purple gradient with a glow.
        public static let blueGlow = Self(
            startColor: Color(red: 120/255, green: 120/255, blue: 255/255),
            endColor: Color(red: 110/255, green: 235/255, blue: 255/255),
            gradientColor: Color(red: 170/255, green: 255/255, blue: 255/255),
            glowColor: .blue,
            labelColor: Color(red: 50/255, green: 90/255, blue: 168/255)
        )
        
        /// An orange/red gradient with a glow.
        public static let orangeGlow = Self(
            startColor: Color(red: 237/255, green: 74/255, blue: 9/255),
            endColor: Color(red: 255/255, green: 150/255, blue: 95/255),
            gradientColor: Color(red: 255/255, green: 158/255, blue: 120/255),
            glowColor: .orange,
            labelColor: .blue
        )
        
        /// A green gradient with a glow.
        public static let greenGlow = Self(
            startColor: Color(red: 50/255, green: 130/255, blue: 50/255),
            endColor: Color(red: 120/255, green: 230/255, blue: 150/255),
            gradientColor: Color(red: 181/255, green: 255/255, blue: 182/255),
            glowColor: .green,
            labelColor: .blue
        )
        
        /// The first color of the line.
        public var startColor: Color
        /// The second color of the line.
        public var endColor: Color
        
        /// The gradient color below the line when in light mode.
        public var gradientColor: Color
        
        /// The gradient color below the line when in dark mode.
        ///
        /// If `nil`, a suitable color will be automatically generated.
        public var darkModeGradientColor: Color?
        
        /// The unwrapped dark mode gradient color.
        public var unwrappedDarkModeGradientColor: Color {
            return darkModeGradientColor ?? Color(
                red: gradientColor.components.red / 2,
                green: gradientColor.components.green / 2,
                blue: gradientColor.components.blue / 2
            )
        }
        
        /// The color that the line glows.
        public var glowColor: Color
        
        /// The color of the labels corresponding to the chart.
        public var labelColor: Color
    }
}
