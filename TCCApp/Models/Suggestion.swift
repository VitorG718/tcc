//
//  Suggestion.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import Foundation

struct Suggestion: Identifiable, Equatable {
    let id: UUID
    let topic: String
    let title: String
    let assignee: User
    var useful: Bool?
    
    static func == (lhs: Suggestion, rhs: Suggestion) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let sample: [Suggestion] = [
        Suggestion(
            id: UUID(), topic: "Configure sua Maquina",
            title: "Como configurar o seu acesso ao banco",
            assignee: User.sample[0]
        ),
        Suggestion(
            id: UUID(), topic: "Configure sua Maquina",
            title: "Como configurar o seu acesso ao banco",
            assignee: User.sample[1]
        ),
    ]
}
