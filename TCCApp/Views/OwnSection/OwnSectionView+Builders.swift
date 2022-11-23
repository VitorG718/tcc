//
//  OwnSectionView+Builders.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

extension OwnSectionView {    
    @ViewBuilder
    func createDeadlinesScroll(with proxy: GeometryProxy) -> some View {
        let deadlines = Deadline.sample.sorted(by: { $0.endDate < $1.endDate })
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: .height(50, in: proxy, min: 20)) {
                ForEach(deadlines) { deadline in
                    DeadlineCard(deadline: deadline, proxy: proxy)
                        .frame(height: .height(237, in: proxy, min: 100))
                }
            }
            .padding([.horizontal, .vertical], 5)
        }
    }
    
    @ViewBuilder
    func createDeadlinesViewAll() -> some View {
        let localizedText: LocalizedStringKey = "Ver Tudo \(Image(systemName: "chevron.right"))"
        HStack(spacing: .zero) {
            Spacer()
            Button(
                action: {},
                label: {
                    Text(localizedText)
                        .font(.system(
                            size: .height(32, in: proxy, min: 15),
                            weight: .medium
                        ))
                        .foregroundColor(.secondary)
                }
            )
            .buttonStyle(.borderless)
        }
        .padding(.top, .height(30, in: proxy, min: 15))
        .padding(.bottom, .height(60, in: proxy, min: 30))
    }
}
