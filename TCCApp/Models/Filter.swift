//
//  Filter.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

struct Filter: Identifiable, Equatable {
    let id: UUID
    let name: String
    let talkStatus: Talk.Status
    
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let filters = [
        Filter(id: UUID(), name: "Em Aberto", talkStatus: .opened),
        Filter(id: UUID(), name: "Finalizadas", talkStatus: .closed),
    ]
}
