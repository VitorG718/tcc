//
//  TalksSectionViewModel.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

class TalksSectionViewModel: ObservableObject {
    private let allTalks = Talk.sample
    @Published var talks = Talk.sample
    private var filters = [Filter]()
    @Published var currentTalk: Talk? = nil
    
    func removeFilter(_ filter: Filter) {
        if let index = filters.firstIndex(of: filter) {
            filters.remove(at: index)
        }
        filterTalks()
    }
    
    func addFilter(_ filter: Filter) {
        if !filters.contains(filter) {
            filters.append(filter)
        }
        filterTalks()
    }
    
    private func filterTalks() {
        let statusToFilter = filters.map(\.talkStatus)
        if statusToFilter.isEmpty {
            talks = allTalks
        } else {
            talks = allTalks.filter({ statusToFilter.contains($0.status) })
        }
    }
}
