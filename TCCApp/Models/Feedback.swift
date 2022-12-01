//
//  Feedback.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import Foundation

struct Feedback: Identifiable {
    let id = UUID()
    let title: String
    let filter: FeedbackFilter
    let author: User
    
    static let sample: [Feedback] = [
        Feedback(
            title: "Solicitação de Pull Request",
            filter: FeedbackFilter.filters[1],
            author: User.sample[0]
        ),
        Feedback(
            title: "Solicitação de Pull Request",
            filter: FeedbackFilter.filters[1],
            author: User.sample[3]
        ),
    ]
}
