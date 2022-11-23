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
                action: {
                    currentTalk = talk
                },
                label: {
                    GeometryReader { metrics in
                        HStack(spacing: .width(30, in: proxy, min: 15)) {
                            let circleSize = metrics.size.height * 0.4
                            Circle()
                                .fill(isSelected ? Color.black : Color.gray)
                                .frame(width: circleSize, height: circleSize)
                            
                            VStack {
                                Text(talk.name)
                                    .font(.system(
                                        size: .height(24, in: proxy, min: 12),
                                        weight: .regular
                                    ))
                                    .foregroundColor(isSelected ? Color.black : Color.white)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxHeight: .infinity)
                    }
                }
            )
            .buttonStyle(.borderless)
            .padding(.trailing, .width(35, in: proxy, min: 15))
            .padding(.leading, .width(45, in: proxy, min: 20))
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1.5)
        }
        .frame(height: .height(160, in: proxy, min: 80))
        .background(isSelected ? Color(token: .activeGreen) : Color(token: .backgroundPrimary))
    }
}
