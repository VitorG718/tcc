//
//  View+CornerRadius.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: RectCorner) -> some View {
        clipShape(RoundedCornersShape(radius: radius, corners: corners))
    }
}

fileprivate struct RoundedCornersShape: Shape {
    var radius: CGFloat = .zero
    var corners: RectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let hasTopLeft = corners.contains(.topLeft)
        let p1 = CGPoint(x: rect.minX, y: hasTopLeft ? (rect.minY + radius) : rect.minY)
        let p2 = CGPoint(x: hasTopLeft ? (rect.minX + radius) : rect.minX, y: rect.minY)

        let hasTopRight = corners.contains(.topRight)
        let p3 = CGPoint(x: hasTopRight ? (rect.maxX - radius) : rect.maxX, y: rect.minY)
        let p4 = CGPoint(x: rect.maxX, y: hasTopRight ? (rect.minY + radius) : rect.minY)

        let hasBottomRight = corners.contains(.bottomRight)
        let p5 = CGPoint(x: rect.maxX, y: hasBottomRight ? (rect.maxY - radius) : rect.maxY)
        let p6 = CGPoint(x: hasBottomRight ? (rect.maxX - radius) : rect.maxX, y: rect.maxY)

        let hasBottomLeft = corners.contains(.bottomLeft)
        let p7 = CGPoint(x: hasBottomLeft ? (rect.minX + radius) : rect.minX, y: rect.maxY)
        let p8 = CGPoint(x: rect.minX, y: hasBottomLeft ? (rect.maxY - radius) : rect.maxY)

        
        path.move(to: p1)
        path.addArc(
            tangent1End: CGPoint(x: rect.minX, y: rect.minY),
            tangent2End: p2, radius: radius
        )
        path.addLine(to: p3)
        path.addArc(
            tangent1End: CGPoint(x: rect.maxX, y: rect.minY),
            tangent2End: p4, radius: radius
        )
        path.addLine(to: p5)
        path.addArc(
            tangent1End: CGPoint(x: rect.maxX, y: rect.maxY),
            tangent2End: p6, radius: radius
        )
        path.addLine(to: p7)
        path.addArc(
            tangent1End: CGPoint(x: rect.minX, y: rect.maxY),
            tangent2End: p8, radius: radius
        )
        path.closeSubpath()

        return path
    }
}
