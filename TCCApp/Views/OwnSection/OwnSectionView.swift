//
//  OwnSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct OwnSectionView: View {
    let proxy: GeometryProxy
    
    var body: some View {
        DefaultSectionView(
            proxy: proxy,
            firstSection: {
                VStack(spacing: .zero) {
                    DefaultSectionView
                        .createHeader("Deadlines", toButtonTitle: "+ Criar", with: proxy)
                        .padding(.bottom, .height(50, in: proxy, min: 20))
                    
                    createDeadlinesScroll(with: proxy)
                    
                    createDeadlinesViewAll()
                }
            },
            secondSection: {
                Color.red
            }
        )
    }
}

struct OwnSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .you)
            .frame(width: 1080, height: 675)
    }
}
