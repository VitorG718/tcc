//
//  ContentSideBar.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct ContentSideBar: View {
    @Binding var currentSection: ContentView.Section
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(spacing: .zero) {
            Spacer()
            
            VStack(spacing: .height(40, in: proxy, min: 15)) {
                ContentSectionButton(
                    label: "Sua área",
                    updateCurrentSegment: $currentSection,
                    to: .you, withProxy: proxy
                )
                
                ContentSectionButton(
                    label: "Discussões",
                    updateCurrentSegment: $currentSection,
                    to: .talks, withProxy: proxy
                )
                
                ContentSectionButton(
                    label: "Equipe",
                    updateCurrentSegment: $currentSection,
                    to: .team, withProxy: proxy
                )
            }
            
            Spacer()
        }
        .padding(.trailing, .width(32, in: proxy, min: 16))
        .padding(.leading, .width(120, in: proxy, min: 40))
        .background(Color(token: .backgroundPrimary))
    }
}

struct ContentSideBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
