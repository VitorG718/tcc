//
//  DeadlineCard+Builders.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

extension DeadlineCard {
    @ViewBuilder
    func createDateIdentifier(metrics: GeometryProxy) -> some View {
        VStack(spacing: .zero) {
            Text(month)
                .foregroundColor(.white)
                .font(.system(
                    size: .height(32, in: proxy, min: 15),
                    weight: .regular
                ))
                .frame(maxWidth: .infinity)
                .frame(height: metrics.size.height * 0.3)
                .background(.white.opacity(0.6))
            
            Text(day)
                .foregroundColor(.white)
                .font(.system(
                    size: .height(64, in: proxy, min: 35),
                    weight: .bold
                ))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white.opacity(0.35))
        }
    }
    
    @ViewBuilder
    func createCategoryIdentifier() -> some View {
        HStack {
            Text(deadline.category)
                .foregroundColor(.white)
                .font(.system(
                    size: .height(24, in: proxy, min: 15),
                    weight: .semibold
                ))
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            Spacer()
            
            Text(dateDistance)
                .foregroundColor(.secondary)
                .font(.system(
                    size: .height(24, in: proxy, min: 12),
                    weight: .medium
                ).italic())
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    @ViewBuilder
    func createContentIdentifier() -> some View {
        Text(deadline.content)
            .foregroundColor(.white)
            .font(.system(
                size: .height(40, in: proxy, min: 18),
                weight: .semibold
            ))
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading
            )
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
}
