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
                        .createHeader("Deadlines", with: proxy, hasButton: .use("+ Criar", {}))
                        .padding(.bottom, .height(50, in: proxy, min: 20))
                    
                    createDeadlinesScroll(with: proxy)
                    
                    createDeadlinesViewAll()
                }
            },
            secondSection: {
                VStack(spacing: .zero) {
                    DefaultSectionView
                        .createHeader("Sugestões", with: proxy, hasButton: .noUse)
                        .padding(.bottom, .height(50, in: proxy, min: 20))
                    
                    VStack(spacing: .height(23, in: proxy, min: 12)) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: .width(45, in: proxy, min: 20)) {
                                ForEach(0...5, id:\.hashValue) { i in
                                    Rectangle()
                                        .fill(Color(token: .backgroundPrimary))
                                        .frame(width: .width(1000, in: proxy, min: 350))
                                        .cornerRadius(20)
                                        .colorMultiply(.blue)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2.5))
                                }
                            }
                            .padding([.leading, .vertical], 2)
                            .padding(.trailing, .width(45, in: proxy, min: 20))
                            .frame(height: .height(488, in: proxy, min: 220))
                        }
                    }
                    
                    Spacer()
                }
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

struct Suggestion: Equatable {
    let id: UUID
    let topic: String
    let title: String
    let assignee: User
    var useful: Bool?
    
    static func == (lhs: Suggestion, rhs: Suggestion) -> Bool {
        return lhs.id == rhs.id
    }
}
