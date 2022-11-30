//
//  TalksSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct TalksSectionView: View {
    @StateObject private var viewModel = TalksSectionViewModel()
    let proxy: GeometryProxy
    
    var body: some View {
        DefaultSectionView(
            proxy: proxy,
            firstSection: {
                VStack(spacing: .zero) {
                    DefaultSectionView
                        .createHeader("Discussões", with: proxy, hasButton: .use("+ Criar", {}))
                    
                    HStack {
                        TextField("Ex: Modelagem do banco de dados...", text: $viewModel.searchText)
                            .textFieldStyle(.plain)
                            .font(.system(
                                size: .height(24, in: proxy, min: 14),
                                weight: .regular
                            ))
                            .padding(.trailing, .width(16, in: proxy, min: 8))
                            .foregroundColor(.white)
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(
                                size: .height(32, in: proxy, min: 20),
                                weight: .semibold
                            ))
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, .height(32, in: proxy, min: 10))
                    .padding(.horizontal, .width(32, in: proxy, min: 10))
                    .border(color: .gray, lineWidth: 1.5, cornerRadius: 20)
                    .padding(.vertical, .height(50, in: proxy, min: 20))
                    
                    
                    createFiltersCarousel()
                    
                    createTalksScroll()
                }
            },
            secondSection: {
                Color.purple
            }
        )
    }
}

struct TalksSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .talks)
            .frame(width: 1080, height: 675)
    }
}

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
