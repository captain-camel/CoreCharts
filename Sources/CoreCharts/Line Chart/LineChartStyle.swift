//
//  LineChartStyle.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

/// A style that determines the colors of a line chart.
public struct LineChartStyle {
    // MARK: Properties
    /// A blue/purple gradient.
    public static let blue = Self(
        startColor: Color(red: 120/255, green: 120/255, blue: 255/255),
        endColor: Color(red: 110/255, green: 235/255, blue: 255/255),
        gradientColor: Color(red: 170/255, green: 255/255, blue: 255/255)
    )
    
    /// An orange/red gradient.
    public static let orange = Self(
        startColor: Color(red: 237/255, green: 74/255, blue: 9/255),
        endColor: Color(red: 255/255, green: 150/255, blue: 95/255),
        gradientColor: Color(red: 255/255, green: 179/255, blue: 135/255)
    )
    
    /// A green gradient.
    public static let green = Self(
        startColor: Color(red: 50/255, green: 130/255, blue: 50/255),
        endColor: Color(red: 120/255, green: 230/255, blue: 150/255),
        gradientColor: Color(red: 181/255, green: 255/255, blue: 182/255)
    )
    
    /// A blue/purple gradient with a glow.
    public static let blueGlow = Self(
        startColor: Color(red: 120/255, green: 120/255, blue: 255/255),
        endColor: Color(red: 110/255, green: 235/255, blue: 255/255),
        gradientColor: Color(red: 170/255, green: 255/255, blue: 255/255),
        glowColor: .blue
    )
    
    /// An orange/red gradient with a glow.
    public static let orangeGlow = Self(
        startColor: Color(red: 237/255, green: 74/255, blue: 9/255),
        endColor: Color(red: 255/255, green: 150/255, blue: 95/255),
        gradientColor: Color(red: 255/255, green: 158/255, blue: 120/255),
        glowColor: .orange
    )
    
    /// A green gradient with a glow.
    public static let greenGlow = Self(
        startColor: Color(red: 50/255, green: 130/255, blue: 50/255),
        endColor: Color(red: 120/255, green: 230/255, blue: 150/255),
        gradientColor: Color(red: 181/255, green: 255/255, blue: 182/255),
        glowColor: .green
    )
    
    /// The first color of the line.
    public var startColor: Color
    /// The second color of the line.
    public var endColor: Color
    
    /// The gradient color below the line.
    public var gradientColor: Color?
    
    /// The color that the line glows.
    public var glowColor: Color?
}
