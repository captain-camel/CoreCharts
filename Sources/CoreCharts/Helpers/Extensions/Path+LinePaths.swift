//
//  Path+LinePaths.swift
//  Cubing Timer (iOS)
//
//  Created by Cameron Delong on 10/4/21.
//

import SwiftUI

extension Path {
    /// Returns a line from a series of points.
    static func linePathWithPoints(points: [Double], step: CGSize) -> Path {
        var path = Path()
        
        guard let max = points.max(), points.count > 1 else { return path }
        
        var point = CGPoint(x: 0, y: CGFloat(max - points[0]) * step.height)
        path.move(to: point)
        
        for pointIndex in 1..<points.count {
            point = CGPoint(
                x: step.width * CGFloat(pointIndex),
                y: step.height * CGFloat(max - points[pointIndex])
            )
            path.addLine(to: point)
        }
        
        return path
    }
    
    /// Returns a filled path from a series of points.
    static func closedLinePathWithPoints(points: [Double], step: CGSize, offset: CGFloat) -> Path {
        var path = Path()
        
        guard let min = points.min(), let max = points.max(), points.count > 1 else { return path }
        
        var point: CGPoint = .zero
        path.move(to: CGPoint(x: 0, y: (max - min) * step.height + offset))
        
        for pointIndex in 0..<points.count {
            point = CGPoint(
                x: step.width * CGFloat(pointIndex),
                y: step.height * CGFloat(max - points[pointIndex])
            )
            path.addLine(to: point)
        }
        
        path.addLine(to: CGPoint(x: point.x, y: (max - min) * step.height + offset))
        path.closeSubpath()
        
        return path
    }
}
