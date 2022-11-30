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
                    
                    createTextField(
                        "Ex: Modelagem do banco de dados...",
                        imageName: "magnifyingglass",
                        textBinding: $viewModel.searchText
                    )
                    .padding(.vertical, .height(50, in: proxy, min: 20))
                    
                    createFiltersCarousel()
                    
                    createTalksScroll()
                }
            },
            secondSection: {
                ZStack {
                    if viewModel.currentTalk == nil {
                        Text("A conversa selecionada\nirá aparecer aqui".uppercased())
                            .font(.system(
                                size: .width(32, in: proxy, min: 20),
                                weight: .regular
                            ))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, .width(50, in: proxy, min: 25))
                            .multilineTextAlignment(.center)
                    } else {
                        VStack(spacing: .height(60, in: proxy, min: 20)) {
                            createChatContent()
                            
                            createTextField(
                                "Escreva sua contribuição aqui",
                                imageName: "paperplane.fill",
                                textBinding: $viewModel.chatText
                            )
                        }
                        .padding(.trailing, .width(66, in: proxy, min: 15))
                    }
                }
            }
        )
        .padding(.bottom, .height(60, in: proxy, min: 20))
    }
}

struct TalksSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .talks)
            .frame(width: 1080, height: 675)
    }
}
