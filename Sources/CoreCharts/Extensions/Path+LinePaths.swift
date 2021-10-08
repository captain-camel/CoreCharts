//
//  Path+LinePaths.swift
//  Cubing Timer (iOS)
//
//  Created by Cameron Delong on 10/4/21.
//

import SwiftUI

extension Path {
    /// Returns a graph from a series of points.
    static func linePathWithPoints(points: [Double], step: CGSize) -> Path {
        var path = Path()
        
        if points.count < 2 {
            return path
        }
        
        guard let offset = points.min() else { return path }
        
        let p1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.height)
        path.move(to: p1)
        
        for pointIndex in 1..<points.count {
            let p2 = CGPoint(
                x: step.width * CGFloat(pointIndex),
                y: step.height * CGFloat(points[pointIndex] - offset)
            )
            path.addLine(to: p2)
        }
        
        return path
    }
    
    /// Returns a filled graph from a series of points.
    static func closedLinePathWithPoints(points: [Double], step: CGSize) -> Path {
        var path = Path()
        
        if points.count < 2 {
            return path
        }
        
        guard let offset = points.min() else { return path }
        
        var p1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.height)
        path.move(to: p1)
        
        for pointIndex in 1..<points.count {
            p1 = CGPoint(
                x: step.width * CGFloat(pointIndex),
                y: step.height * CGFloat(points[pointIndex] - offset)
            )
            path.addLine(to: p1)
        }
        
        path.addLine(to: CGPoint(x: p1.x, y: 0))
        path.closeSubpath()
        
        return path
    }
}
