//
//  TalksCard.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

struct TalksCard: View {
    let talk: Talk
    @Binding var currentTalk: Talk?
    let proxy: GeometryProxy
    var isSelected: Bool { currentTalk == talk }
    
    var body: some View {
        VStack(spacing: .zero) {
            Button(
                action: { currentTalk = talk },
                label: {
                    GeometryReader { metrics in
                        HStack(spacing: .width(30, in: proxy, min: 15)) {
                            let circleSize = metrics.size.height * 0.4
                            Circle()
                                .fill(isSelected ? Color.black : Color.gray)
                                .frame(width: circleSize, height: circleSize)
                            
                            createCardContent()
                        }
                        .frame(maxHeight: .infinity)
                    }
                }
            )
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.trailing, .width(35, in: proxy, min: 15))
            .padding(.leading, .width(45, in: proxy, min: 20))
        }
        .frame(height: .height(160, in: proxy, min: 80))
        .background(isSelected ? Color(token: .activeGreen) : Color(token: .backgroundPrimary))
    }
    
    @ViewBuilder
    func createCardContent() -> some View {
        let assignees = talk.autores.joined(separator: ", ")
        
        VStack(alignment: .leading, spacing: .height(9, in: proxy, min: 5)) {
            HStack(spacing: .zero) {
                Text(talk.status.rawValue.uppercased())
                Spacer()
                Text(talk.lastUpdate.formatted(date: .numeric, time: .omitted))
            }
            .font(.system(
                size: .height(20, in: proxy, min: 10),
                weight: .regular
            ))
            
            Text(talk.name)
                .font(.system(
                    size: .height(30, in: proxy, min: 15),
                    weight: .medium
                ))
            
            Text(assignees)
                .font(.system(
                    size: .height(24, in: proxy, min: 12),
                    weight: .regular
                ))
        }
        .lineLimit(1)
        .foregroundColor(isSelected ? Color.black : Color.white)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
