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
    
    @ViewBuilder
    func createFeedbacksArea() -> some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("FEEDBACKS")
                .font(.system(
                    size: .height(32, in: proxy, min: 16),
                    weight: .medium
                ))
                .foregroundColor(.white)
            
            createFeedbacksAreaFiltersCarousel()
                .padding(.vertical, .height(25, in: proxy, min: 10))
            
            createFeedbacksScroll()
        }
        .padding(.trailing, .width(66, in: proxy, min: 15))
        .padding(.top, .height(30, in: proxy, min: 15))
        .padding(.bottom, .height(60, in: proxy, min: 30))
    }
    
    @ViewBuilder
    func createFeedbacksAreaFiltersCarousel() -> some View {
        HStack(spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .width(17, in: proxy, min: 10)) {
                    ForEach(FeedbackFilter.filters) { filter in
                        FilterButton(
                            filter: filter, proxy: proxy,
                            handler: { (_, _) in }
                        )
                    }
                }
                .padding([.vertical, .horizontal], 1)
            }
            
            Image(systemName: "chevron.forward")
                .font(.system(
                    size: .height(36, in: proxy, min: 18),
                    weight: .semibold
                ))
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder
    private func createFeedbacksScroll() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: .height(20, in: proxy, min: 10)) {
                ForEach(Feedback.sample) { feedback in
                    createFeedbacksScrollCard(to: feedback)
                }
            }
            .padding([.vertical, .horizontal], 1)
        }
        .padding(.vertical, .height(45, in: proxy, min: 20))
        .padding(.leading, .height(32, in: proxy, min: 10))
        .padding(.trailing, .height(60, in: proxy, min: 20))
        .background(Color(token: .backgroundPrimary))
        .border(color: .gray, cornerRadius: 20)
    }
    
    @ViewBuilder
    func createFeedbacksScrollCard(to feedback: Feedback) -> some View {
        HStack(spacing: .width(30, in: proxy, min: 15)) {
            let imageSize = CGFloat.width(50, in: proxy, min: 25)
            Image(systemName: "hand.thumbsup.fill")
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .padding(.width(20, in: proxy, min: 10))
                .background(feedback.filter.color.opacity(0.8))
                .border(color: .clear, cornerRadius: 15)
            
            VStack(alignment: .leading, spacing: .zero) {
                Text(feedback.filter.name.uppercased())
                    .font(.system(
                        size: .height(16, in: proxy, min: 10),
                        weight: .regular
                    ))
                    .foregroundColor(feedback.filter.color)
                
                Text(feedback.title)
                    .font(.system(
                        size: .height(24, in: proxy, min: 14),
                        weight: .semibold
                    ))
                    .foregroundColor(.white)
                    .padding(.bottom, .height(6, in: proxy, min: 3))
                
                createFeedbacksScrollCardFooter(to: feedback.author)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, .height(30, in: proxy, min: 15))
        .padding(.horizontal, .width(30, in: proxy, min: 15))
        .background(Color(nsColor: .darkGray))
        .border(color: .gray, cornerRadius: 10)
    }
    
    @ViewBuilder
    func createFeedbacksScrollCardFooter(to author: User) -> some View {
        HStack(spacing: .width(10, in: proxy, min: 5)) {
            Text("Por")
                .font(.system(
                    size: .height(15, in: proxy, min: 12),
                    weight: .medium
                ))
                .foregroundColor(.secondary)
            
            HStack(spacing: .zero){
                Image(systemName: "person.circle")
                    .font(.system(
                        size: .height(15, in: proxy, min: 12),
                        weight: .bold
                    ))
                    .foregroundColor(.white)
                
                Text(author.firstName)
                    .font(.system(
                        size: .height(15, in: proxy, min: 12),
                        weight: .regular
                    ))
                    .foregroundColor(.white)
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
