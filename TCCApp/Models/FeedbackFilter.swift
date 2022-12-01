//
//  FeedbackFilter.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import SwiftUI

struct FeedbackFilter: Filter, Equatable {
    let id: UUID
    let name: String
    let color: Color
    
    static func == (lhs: FeedbackFilter, rhs: FeedbackFilter) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let filters = [
        FeedbackFilter(id: UUID(), name: "Erro", color: .red),
        FeedbackFilter(id: UUID(), name: "Acerto", color: Color(token: .activeGreen)),
    ]
}
