//
//  ContentView.swift
//  TCCApp
//
//  Created by Vitor Souza on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    enum Section {
        case you, talks, team
    }
    
    @State var currentSection: Section = .you
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: .zero) {
                ContentSideBar(
                    currentSection: $currentSection,
                    proxy: proxy
                )
                
                VStack(spacing: .zero) {
                    createHeader(with: proxy)
                        .padding(.top, .height(136, in: proxy, min: 38))
                    
                    Spacer()
                    
                    ZStack {
                        switch currentSection {
                        case .you:
                            OwnSectionView(proxy: proxy)
                                .padding(.top, .height(80, in: proxy, min: 30))
                        case .talks:
                            TalksSectionView(proxy: proxy)
                        case .team:
                            TeamSectionView(proxy: proxy)
                        }
                    }
                    .padding(.top, 4)
                    .padding(.leading, .width(66, in: proxy, min: 15))
                }
            }
            .background(Color(token: .backgroundSecondary))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 1080, height: 675)
    }
}
