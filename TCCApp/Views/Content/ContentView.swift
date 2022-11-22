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
    
    @State private var currentSection: Section = .you
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: .zero) {
                ContentSideBar(
                    currentSection: $currentSection,
                    proxy: proxy
                )
                
                Spacer()
            }
            .background(Color(token: .backgroundSecondary))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
