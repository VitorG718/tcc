//
//  TeamSectionView+Builders.swift
//  TCCApp
//
//  Created by Vitor Gledison Oliveira de Souza on 23/11/22.
//

import SwiftUI

extension TeamSectionView {
    @ViewBuilder
    func createUserCard(to user: User, with proxy: GeometryProxy) -> some View {
        GeometryReader { metrics in
            VStack(spacing: .zero) {
                VStack(spacing: .zero) {
                    HStack(spacing: 20) {
                        Spacer()
                    }
                    .frame(maxHeight: .infinity)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 2)
                    
                    HStack(spacing: 20) {
                        Spacer()
                    }
                    .frame(height: metrics.size.height * 0.25)
                }
                .frame(maxWidth: .infinity)
                .background(Color(token: .backgroundPrimary))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2.5))
                
                let titles = ["Recomendar", "Dar um Feedback", "Dar um Feedback"]
                HStack(spacing: 10) {
                    ForEach(titles, id: \.hashValue) { cardTitle in
                        createCardButton(title: cardTitle, with: proxy, handler: {})
                    }
                }
                .frame(height: metrics.size.height * 0.18)
                .padding(.top, .height(30, in: proxy, min: 10))
            }
        }
        .frame(height: .height(350, in: proxy, min: 200))
    }
    
    @ViewBuilder
    func createCardButton(
        title: String, with proxy: GeometryProxy,
        handler: @escaping () -> Void
    ) -> some View {
        GeometryReader { metrics in
            Text(title.uppercased())
                .font(.system(
                    size: .height(25, in: proxy, min: 8),
                    weight: .semibold
                ))
                .foregroundColor(Color(token: .backgroundPrimary))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}
