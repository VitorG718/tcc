//
//  ContentView+Builders.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

extension ContentView {
    @ViewBuilder
    func createHeader(with proxy: GeometryProxy) -> some View {
        HStack(alignment: .top, spacing: .zero) {
            createHeaderGreetings(
                with: proxy,
                inHomeSection: currentSection == .you
            )
            .padding(.leading, .width(66, in: proxy, min: 15))
            
            Spacer()
            
            UserButton(proxy: proxy)
                .padding(.trailing, .width(177, in: proxy, min: 50))
        }
    }
    
    @ViewBuilder
    func createHeaderGreetings(with proxy: GeometryProxy, inHomeSection: Bool) -> some View {
        if inHomeSection {
            VStack(alignment: .leading, spacing: .height(10, in: proxy, min: 5)) {
                Text("Olá, Jessé")
                    .font(.system(
                        size: .height(64, in: proxy, min: 32),
                        weight: .medium
                    ))
                    .foregroundColor(.white)
                
                Text("seja bem-vindo")
                    .font(.system(
                        size: .height(32, in: proxy, min: 16),
                        weight: .regular
                    ))
                    .foregroundColor(.white)
            }
        } else { EmptyView() }
    }
}

struct ContentViewBuilders_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 1080, height: 675)
    }
}
