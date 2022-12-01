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
        VStack(alignment: .trailing, spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                Text("NOME DO\nPROJETO")
                    .font(.system(
                        size: .height(40, in: proxy, min: 20),
                        weight: .bold
                    ))
                    .foregroundColor(Color(token: .activeGreen))
                    .overlay {
                        VStack {
                            Spacer()
                            Rectangle()
                                .fill(Color(token: .activeGreen))
                                .frame(height: 1)
                        }
                    }
                
                Text("by Company X")
                    .font(.system(
                        size: .height(20, in: proxy, min: 10),
                        weight: .ultraLight
                    ))
                    .foregroundColor(.secondary)
                    .padding(.top, .height(16, in: proxy, min: 5))
            }
            .padding(.top, .height(100, in: proxy, min: 50))
            .padding(.trailing, .width(32, in: proxy, min: 16))
            
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
            .frame(width: 1080, height: 675)
    }
}
