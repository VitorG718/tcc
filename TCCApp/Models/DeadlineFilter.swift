//
//  Filter.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

struct DeadlineFilter: Filter, Equatable {
    let id: UUID
    let name: String
    let talkStatus: Talk.Status
    
    static func == (lhs: DeadlineFilter, rhs: DeadlineFilter) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let filters = [
        DeadlineFilter(id: UUID(), name: "Em Aberto", talkStatus: .opened),
        DeadlineFilter(id: UUID(), name: "Finalizadas", talkStatus: .closed),
    ]
}
