//
//  TalksSectionView+Builders.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import SwiftUI

extension TalksSectionView {
    @ViewBuilder
    func createFiltersCarousel() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .width(17, in: proxy, min: 10)) {
                ForEach(Filter.filters) { filter in
                    FilterButton(
                        filter: filter, proxy: proxy,
                        handler: { filter, selected in
                            if selected {
                                viewModel.addFilter(filter)
                            } else {
                                viewModel.removeFilter(filter)
                            }
                        }
                    )
                }
            }
            .padding([.vertical, .horizontal], 1)
        }
    }
    
    @ViewBuilder
    func createTalksScroll() -> some View {
        let lastTalkID = viewModel.talks.last?.id
        let firstTalkID = viewModel.talks.first?.id
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: .zero) {
                ForEach(viewModel.talks) { talk in
                    let corners: RectCorner = {
                        var corners: RectCorner = []
                        if talk.id == firstTalkID {
                            corners.insert([.topRight, .topLeft])
                        }
                        if talk.id == lastTalkID {
                            corners.insert([.bottomRight, .bottomLeft])
                        }
                        return corners
                    }()
                    
                    TalksCard(
                        talk: talk,
                        currentTalk: $viewModel.currentTalk,
                        proxy: proxy
                    )
                    .cornerRadius(20, corners: corners)
                    
                    if talk.id != lastTalkID {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 2)
                    }
                }
            }
            .padding([.vertical, .horizontal], 1)
        }
        .border(color: .clear, cornerRadius: 20)
        .padding(.vertical, .height(60, in: proxy, min: 20))
    }
}
