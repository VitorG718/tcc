//
//  TalksSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct TalksSectionView: View {
    @StateObject var viewModel = TalksSectionViewModel()
    let proxy: GeometryProxy
    
    init(proxy: GeometryProxy) {
        self.proxy = proxy
    }
    
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
