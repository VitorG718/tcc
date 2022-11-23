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
                        .padding(.bottom, .height(50, in: proxy, min: 20))
                    
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
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: .zero) {
                            ForEach(viewModel.talks) { talk in
                                TalksCard(talk: talk, currentTalk: $viewModel.currentTalk, proxy: proxy)
                            }
                        }
                    }
                    
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
