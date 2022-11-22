//
//  CGFloat+Metrics.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

public extension CGFloat {
    private static let baseWidth: CGFloat = 2481
    private static let baseHeight: CGFloat = 1772
    
    static func width(_ value: CGFloat, in proxy: GeometryProxy, min: CGFloat? = nil) -> CGFloat {
        return getDimension(
            value, to: proxy.size.width,
            withBaseValue: baseWidth, min: min
        )
    }
    
    static func width(multiplier: CGFloat, in proxy: GeometryProxy) -> CGFloat {
        let currentWidth = proxy.size.width
        return multiplier * currentWidth
    }
    
    static func height(_ value: CGFloat, in proxy: GeometryProxy, min: CGFloat? = nil) -> CGFloat {
        return getDimension(
            value, to: proxy.size.height,
            withBaseValue: baseHeight, min: min
        )
    }
    
    private static func getDimension(
        _ value: CGFloat,
        to current: CGFloat,
        withBaseValue baseValue: CGFloat,
        min minValue: CGFloat?
    ) -> CGFloat {
        let scalingFactor = current / baseValue
        let scaledValue = value * (scalingFactor > 1.0 ? 1.0 : scalingFactor)
        if let minValue, scaledValue < minValue {
            return minValue
        }
        return scaledValue
    }
}
