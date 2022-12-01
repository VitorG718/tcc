//
//  TalksSectionView+Builders.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import SwiftUI

extension TalksSectionView {
    @ViewBuilder
    func createTextField(
        _ placeholder: String,
        imageName: String,
        textBinding: Binding<String>
    ) -> some View {
        HStack {
            TextField(placeholder, text: textBinding)
                .textFieldStyle(.plain)
                .font(.system(
                    size: .height(24, in: proxy, min: 14),
                    weight: .regular
                ))
                .padding(.trailing, .width(16, in: proxy, min: 8))
                .onSubmit(of: .text, viewModel.sendMessage)
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .font(.system(
                    size: .height(32, in: proxy, min: 20),
                    weight: .semibold
                ))
                .foregroundColor(.secondary)
        }
        .padding(.vertical, .height(32, in: proxy, min: 10))
        .padding(.horizontal, .width(32, in: proxy, min: 10))
        .background(Color(token: .backgroundPrimary))
        .border(color: .gray, lineWidth: 1.5, cornerRadius: 20)
    }
    
    @ViewBuilder
    func createFiltersCarousel() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .width(17, in: proxy, min: 10)) {
                ForEach(DeadlineFilter.filters) { filter in
                    FilterButton(
                        filter: filter, proxy: proxy,
                        handler: { filter, selected in
                            if selected {
                                viewModel.addFilter(filter)
                            } else {
                                viewModel.removeFilter(filter)
                            }
                        }
                    )
                }
            }
            .padding([.vertical, .horizontal], 1)
        }
    }
    
    @ViewBuilder
    func createTalksScroll() -> some View {
        let lastTalkID = viewModel.talks.last?.id
        let firstTalkID = viewModel.talks.first?.id
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: .zero) {
                ForEach(viewModel.talks) { talk in
                    let corners: RectCorner = {
                        var corners: RectCorner = []
                        if talk.id == firstTalkID {
                            corners.insert([.topRight, .topLeft])
                        }
                        if talk.id == lastTalkID {
                            corners.insert([.bottomRight, .bottomLeft])
                        }
                        return corners
                    }()
                    
                    TalksCard(
                        talk: talk,
                        currentTalk: $viewModel.currentTalk,
                        proxy: proxy
                    )
                    .cornerRadius(20, corners: corners)
                    
                    if talk.id != lastTalkID {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 2)
                    }
                }
            }
            .padding([.vertical, .horizontal], 1)
        }
        .border(color: .clear, cornerRadius: 20)
        .padding(.top, .height(60, in: proxy, min: 20))
    }
    
    @ViewBuilder
    func createChatContent() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { reader in
                LazyVStack(spacing: .zero) {
                    ForEach(viewModel.messages) { message in
                        createMessageCard(to: message)
                            .padding(.bottom, .height(45, in: proxy, min: 20))
                            .id(message.id)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, .width(50, in: proxy, min: 20))
                .padding(.vertical, .height(50, in: proxy, min: 20))
                .onChange(of: viewModel.messages) { newMessages in
                    if let lastId = newMessages.last?.id {
                        reader.scrollTo(lastId, anchor: .bottom)
                    }
                }
            }
        }
        .background(Color(token: .backgroundPrimary))
        .border(color: .gray, cornerRadius: 20)
        .padding(.top, .height(60, in: proxy, min: 30))
    }
    
    @ViewBuilder
    private func createMessageCard(to message: Message) -> some View {
        VStack {
            HStack(spacing: .width(50, in: proxy, min: 20)) {
                if let media = message.media {
                    let aspectRatio = 311.0 / 552.0
                    let width = CGFloat.width(550, in: proxy, min: 200)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: width, height: width * aspectRatio)
                        .overlay(content: { createMessageMediaOverlay(to: media) })
                        .border(color: .white, cornerRadius: 10)
                }
                
                VStack(spacing: .height(15, in: proxy, min: 10)) {
                    Text(message.content)
                        .font(.system(
                            size: .height(24, in: proxy, min: 14),
                            weight: .medium
                        ))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.trailing, .width(40, in: proxy, min: 20))
                    
                    createMessageAuthorLabel(to: message.author)
                }
            }
            .padding(.vertical, .height(45, in: proxy, min: 20))
            .padding(.horizontal, .width(45, in: proxy, min: 20))
            .background(Color(token: .backgroundSecondary))
            .cornerRadius(20)
            
            createMessageInteractionLabel(message)
        }
    }
    
    @ViewBuilder
    private func createMessageAuthorLabel(to author: User) -> some View {
        HStack(spacing: .width(17, in: proxy, min: 8)) {
            Spacer()
            Image(systemName: "person.circle")
                .font(.system(
                    size: .height(32, in: proxy, min: 20),
                    weight: .bold
                ))
                .foregroundColor(author.color)
            
            Text(author.firstName)
                .font(.system(
                    size: .height(24, in: proxy, min: 14),
                    weight: .semibold
                ))
                .fontWeight(.regular)
        }
    }
    
    @ViewBuilder
    private func createMessageMediaOverlay(to media: MessageMedia) -> some View {
        Text(media.content)
    }
    
    @ViewBuilder
    private func createMessageInteractionLabel(_ message: Message) -> some View {
        HStack(spacing: .width(20, in: proxy, min: 10)) {
            let title: LocalizedStringKey = "\(Image(systemName: "hand.thumbsup.fill")) Curtir"
            DefaultButton(title: title, proxy: proxy, action: { })
            
            HStack(spacing: .width(10, in: proxy, min: 5)) {
                ForEach(Array(message.likes.prefix(3))) { user in
                    Image(systemName: "person.circle")
                        .font(.system(
                            size: .height(32, in: proxy, min: 20),
                            weight: .bold
                        ))
                        .foregroundColor(user.color)
                }
                
                if message.likes.count > 3 {
                    Image(systemName: "plus.circle")
                        .font(.system(
                            size: .height(32, in: proxy, min: 20),
                            weight: .regular
                        ))
                        .foregroundColor(.secondary)
                }
            }
            
            if !message.likes.isEmpty {
                Text("Curtiram")
                    .font(.system(
                        size: .height(20, in: proxy, min: 12),
                        weight: .regular
                    ))
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
    }
}

struct TalksSectionViewBuilders_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .talks)
            .frame(width: 1080, height: 675)
    }
}
