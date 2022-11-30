//
//  TalksSectionViewModel.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

class TalksSectionViewModel: ObservableObject {
    private let allTalks: [Talk]
    private var filteredTalks: [Talk]
    @Published var talks: [Talk]
    private var filters: [Filter]
    @Published var currentTalk: Talk?
    @Published var searchText: String {
        didSet { filterBySearchText() }
    }
    
    init() {
        let allTalks = Talk.sample
        self.allTalks = allTalks
        self.filteredTalks = allTalks
        self.talks = allTalks
        self.filters = [Filter]()
        self.currentTalk = nil
        self.searchText = ""
    }
    
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
        if statusToFilter.isEmpty && searchText.count < 3 {
            filteredTalks = allTalks
        } else {
            filteredTalks = allTalks.filter({ statusToFilter.contains($0.status) })
        }
        filterBySearchText()
    }
    
    private func filterBySearchText() {
        if searchText.count >= 3 {
            talks = filteredTalks.filter({ $0.name.contains(searchText) })
        } else {
            talks = filteredTalks
        }
    }
}
