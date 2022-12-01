//
//  OwnSectionView+Builders.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

extension OwnSectionView {    
    @ViewBuilder
    func createDeadlinesScroll(with proxy: GeometryProxy) -> some View {
        let deadlines = Deadline.sample.sorted(by: { $0.endDate < $1.endDate })
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: .height(50, in: proxy, min: 20)) {
                ForEach(deadlines) { deadline in
                    DeadlineCard(deadline: deadline, proxy: proxy)
                        .frame(height: .height(237, in: proxy, min: 100))
                }
            }
            .padding([.horizontal, .vertical], 5)
        }
    }
    
    @ViewBuilder
    func createDeadlinesViewAll() -> some View {
        let localizedText: LocalizedStringKey = "Ver Tudo \(Image(systemName: "chevron.right"))"
        HStack(spacing: .zero) {
            Spacer()
            Button(
                action: {},
                label: {
                    Text(localizedText)
                        .font(.system(
                            size: .height(32, in: proxy, min: 15),
                            weight: .medium
                        ))
                        .foregroundColor(.secondary)
                }
            )
            .buttonStyle(.borderless)
        }
        .padding(.top, .height(30, in: proxy, min: 15))
        .padding(.bottom, .height(60, in: proxy, min: 30))
    }
    
    @ViewBuilder
    func createSuggestionsCarousel() -> some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: .width(45, in: proxy, min: 20)) {
                ForEach(Suggestion.sample) { suggestion in
                    Rectangle()
                        .fill(Color(nsColor: .darkGray))
                        .frame(width: .width(1000, in: proxy, min: 350))
                        .cornerRadius(20)
                        .colorMultiply(suggestion.assignee.color)
                        .overlay(content: { createSuggestionCardOverlay(with: suggestion) })
                        .border(color: .gray, lineWidth: 2.5, cornerRadius: 20)
                }
            }
            .padding([.leading, .vertical], 2)
            .padding(.trailing, .width(45, in: proxy, min: 20))
            .frame(height: .height(488, in: proxy, min: 220))
        }
    }
    
    @ViewBuilder
    private func createSuggestionCardOverlay(with suggestion: Suggestion) -> some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(suggestion.topic)
                .font(.system(
                    size: .height(32, in: proxy, min: 16),
                    weight: .regular
                ))
                .foregroundColor(.secondary)
                .padding(.bottom, .height(30, in: proxy, min: 10))
            
            Text(suggestion.title)
                .font(.system(
                    size: .height(48, in: proxy, min: 24),
                    weight: .semibold
                ))
                .foregroundColor(.white)
            
            Spacer()
            createSuggestionCardFooter(to: suggestion.assignee)
        }
        .padding(.leading, .width(60, in: proxy, min: 30))
        .padding(.trailing, .width(45, in: proxy, min: 20))
        .padding(.bottom, .height(45, in: proxy, min: 20))
        .padding(.top, .height(80, in: proxy, min: 30))
    }
    
    @ViewBuilder
    private func createSuggestionCardFooter(to user: User) -> some View {
        HStack {
            createSuggestionCardFooterAuthor(to: user)
            Spacer()
            
            createSuggestionCardFooterUsefulTip()
        }
    }
    
    @ViewBuilder
    private func createSuggestionCardFooterAuthor(to author: User) -> some View {
        VStack(alignment: .leading, spacing: .height(14, in: proxy, min: 7)) {
            Text("Thread criado por")
                .font(.system(
                    size: .height(20, in: proxy, min: 10),
                    weight: .semibold
                ))
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "person.circle")
                    .font(.system(
                        size: .height(32, in: proxy, min: 20),
                        weight: .bold
                    ))
                    .foregroundColor(author.color)
                
                Text(author.firstName)
                    .font(.system(
                        size: .height(32, in: proxy, min: 20),
                        weight: .semibold
                    ))
                    .fontWeight(.regular)
            }
        }
    }
    
    @ViewBuilder
    private func createSuggestionCardFooterUsefulTip() -> some View {
        VStack {
            Text("Isso é util para você?")
                .font(.system(
                    size: .height(20, in: proxy, min: 10),
                    weight: .semibold
                ))
                .foregroundColor(.white)
            
            HStack(spacing: .width(16, in: proxy, min: 8)) {
                DefaultButton(title: "Sim", proxy: proxy)
                DefaultButton(title: "Não", proxy: proxy)
            }
        }
    }
}

struct OwnSectionViewBuilders_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .you)
            .frame(width: 1080, height: 675)
    }
}
