//
//  Path+QuadCurves.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

extension Path {
    /// Returns a smooth line from a series of points.
    static func quadCurvedPathWithPoints(points: [Double], step: CGSize) -> Path {
        var path = Path()
        
        guard let max = points.max(), points.count > 1 else { return path }
        
        var point1 = CGPoint(x: 0, y: CGFloat(max - points[0]) * step.height)
        path.move(to: point1)
        
        for pointIndex in 1..<points.count {
            let point2 = CGPoint(
                x: step.width * CGFloat(pointIndex),
                y: step.height * CGFloat(max - points[pointIndex])
            )
            let midPoint = CGPoint.midPointForPoints(p1: point1, p2: point2)
            
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: point1))
            path.addQuadCurve(to: point2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: point2))
            
            point1 = point2
        }
        
        return path
    }
    
    /// Returns a smooth filled path from a series of points.
    static func quadClosedCurvedPathWithPoints(points: [Double], step: CGSize, offset: CGFloat) -> Path {
        var path = Path()
        
        guard let min = points.min(), let max = points.max(), points.count > 1 else { return path }
        
        path.move(to: CGPoint(x: 0, y: (max - min) * step.height + offset))
        
        var point1 = CGPoint(x: 0, y: CGFloat(max - points[0]) * step.height)
        path.addLine(to: point1)
        
        for pointIndex in 1..<points.count {
            let point2 = CGPoint(
                x: step.width * CGFloat(pointIndex),
                y: step.height * CGFloat(max - points[pointIndex])
            )
            let midPoint = CGPoint.midPointForPoints(p1: point1, p2: point2)
            
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: point1))
            path.addQuadCurve(to: point2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: point2))
            
            point1 = point2
        }
        
        path.addLine(to: CGPoint(x: point1.x, y: (max - min) * step.height + offset))
        path.closeSubpath()
        
        return path
    }
}
