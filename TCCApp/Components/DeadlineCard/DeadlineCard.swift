//
//  DeadlineCard.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

struct DeadlineCard: View {
    let deadline: Deadline
    let proxy: GeometryProxy
    let day: String
    let month: String
    let dateDistance: String
    
    init(deadline: Deadline, proxy: GeometryProxy) {
        self.deadline = deadline
        self.proxy = proxy
        (day, month, dateDistance) = DeadlineCardUtils.createLabels(to: deadline.endDate)
    }
    
    var body: some View {
        ZStack {
            Color.black
                .overlay(Color.white.opacity(0.15))
            
            GeometryReader { metrics in
                HStack(spacing: .zero) {
                    createDateIdentifier(metrics: metrics)
                        .frame(width: metrics.size.width * 0.3)
                    
                    VStack(spacing: .zero) {
                        createCategoryIdentifier()
                            .frame(height: metrics.size.height * 0.3)
                        
                        createContentIdentifier()
                    }
                    .padding(.horizontal, .width(30, in: proxy, min: 15))
                }
            }
        }
        .colorMultiply(deadline.color)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(deadline.color, lineWidth: 2))
    }
}
