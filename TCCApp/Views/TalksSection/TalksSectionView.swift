//
//  TalksSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct TalksSectionView: View {
    let proxy: GeometryProxy
    
    var body: some View {
        DefaultSectionView(
            proxy: proxy,
            firstSection: {
                Color.yellow
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
