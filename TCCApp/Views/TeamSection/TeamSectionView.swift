//
//  TeamSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct TeamSectionView: View {
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Text("Equipe".uppercased())
                    .font(.system(
                        size: .height(40, in: proxy, min: 22),
                        weight: .medium
                    ))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            DefaultSectionView
                .createHeader("nesse projeto", with: proxy, hasButton: .use("+  Convidar", {}))
                .padding(.vertical, .height(50, in: proxy, min: 20))
            
            let columns = [
                GridItem(.flexible(), spacing: .width(64, in: proxy, min: 25)),
                GridItem(.flexible(), spacing: .zero)
            ]
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: .height(70, in: proxy, min: 30)) {
                    ForEach(Array(User.sample.prefix(4))) { user in
                        createUserCard(to: user, with: proxy)
                    }
                }
                .padding([.vertical, .horizontal], 5)
            }
        }
        .padding(.trailing, .width(120, in: proxy, min: 30))
    }
}

struct TeamSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .team)
            .frame(width: 1080, height: 675)
    }
}
