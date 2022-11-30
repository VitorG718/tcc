//
//  TeamSectionView+Builders.swift
//  TCCApp
//
//  Created by Vitor Gledison Oliveira de Souza on 23/11/22.
//

import SwiftUI

extension TeamSectionView {
    @ViewBuilder
    func createUserCard(to user: User, with proxy: GeometryProxy) -> some View {
        GeometryReader { metrics in
            VStack(spacing: .zero) {
                VStack(spacing: .zero) {
                    createCardContent(with: proxy, user: user)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 2)
                    
                    createCardFooter(toUser: user, with: proxy)
                        .frame(maxWidth: .infinity)
                        .frame(height: metrics.size.height * 0.25)
                }
                .frame(maxWidth: .infinity)
                .background(Color(token: .backgroundPrimary))
                .border(color: .gray, lineWidth: 2.5, cornerRadius: 20)
                
                let titles = ["Recomendar", "Dar um Feedback", "Avaliar"]
                HStack(spacing: 10) {
                    ForEach(titles, id: \.hashValue) { cardTitle in
                        createCardButton(title: cardTitle, with: proxy, handler: {})
                    }
                }
                .frame(height: metrics.size.height * 0.15)
                .padding(.top, .height(30, in: proxy, min: 10))
            }
        }
        .frame(height: .height(400, in: proxy, min: 230))
    }
    
    @ViewBuilder
    private func createCardButton(
        title: String, with proxy: GeometryProxy,
        handler: @escaping () -> Void
    ) -> some View {
        GeometryReader { metrics in
            Text(title.uppercased())
                .font(.system(
                    size: .height(25, in: proxy, min: 8),
                    weight: .semibold
                ))
                .foregroundColor(Color(token: .backgroundPrimary))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
    
    @ViewBuilder
    private func createCardContent(with proxy: GeometryProxy, user: User) -> some View {
        let color = user.color
        let username = "\(user.firstName) \(user.lastName)"
        let role = user.role
        let admission = getAdmissionMessage(to: user.admissionDate)
        
        HStack(spacing: .zero) {
            VStack(spacing: .zero) {
                Spacer()
                
                let imageSize: CGFloat = .height(230, in: proxy, min: 90)
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(color)
                    .padding(.trailing, .width(40, in: proxy, min: 20))
            }
            
            VStack(spacing: .zero) {
                HStack {
                    Spacer()
                    Button(
                        action: {},
                        label: {
                            let imageSize: CGFloat = .height(40, in: proxy, min: 20)
                            Image(systemName: "ellipsis.circle.fill")
                                .resizable()
                                .frame(width: imageSize, height: imageSize)
                                .foregroundColor(.secondary)
                        }
                    )
                    .buttonStyle(.borderless)
                }
                
                Spacer()
                
                Text(username.uppercased())
                    .font(.system(size: .height(32, in: proxy, min: 18), weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .foregroundColor(color)
                    .padding(.bottom, .height(9, in: proxy, min: 5))
                
                Text(role)
                    .font(.system(size: .height(20, in: proxy, min: 12), weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .padding(.bottom, .height(40, in: proxy, min: 15))
                
                Text(admission)
                    .font(.system(size: .height(20, in: proxy, min: 12), weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
            .padding(.vertical, .height(20, in: proxy, min: 8))
        }
        .padding(.horizontal, .width(40, in: proxy, min: 20))
    }
    
    private func getAdmissionMessage(to date: Date) -> String {
        let components = Calendar.current.dateComponents([.month, .year], from: date)
        let month = Date.getMonthName(from: components.month, style: .long).lowercased()
        let year = String(components.year ?? 2022)
        
        return "Na equipe desde \(month) de \(year)"
    }
    
    @ViewBuilder
    private func createCardFooter(
        toUser user: User,
        with proxy: GeometryProxy
    ) -> some View {
        HStack(spacing: .width(30, in: proxy, min: 15)) {
            createCardFooterContent(
                title: "TÓPICOS\nESCRITOS",
                content: String(format: "%02i", user.writtenTopics),
                contentFont: .system(
                    size: .height(32, in: proxy, min: 20),
                    weight: .heavy
                ),
                with: proxy
            )
            
            createCardFooterContent(
                title: "Seus\nassuntos",
                content: user.topics.joined(separator: ", "),
                contentFont: .system(
                    size: .height(16, in: proxy, min: 10),
                    weight: .medium
                ),
                with: proxy
            )
        }
        .padding(.horizontal, .width(30, in: proxy, min: 15))
    }
    
    @ViewBuilder
    private func createCardFooterContent(
        title: String,
        content: String,
        contentFont: Font,
        with proxy: GeometryProxy
    ) -> some View {
        HStack(spacing: .width(30, in: proxy, min: 15)) {
            Text(title)
                .font(.system(
                    size: .height(16, in: proxy, min: 10),
                    weight: .light
                ))
                .foregroundColor(.white)
            
            Text(content)
                .font(contentFont)
                .foregroundColor(.white)
        }
        .padding(.horizontal, .width(30, in: proxy, min: 15))
        .padding(.vertical, .height(15, in: proxy, min: 5))
        .border(color: .gray, lineWidth: 2, cornerRadius: 10)
    }
}

struct TeamSectionViewBuilders_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .team)
            .frame(width: 1080, height: 675)
    }
}
