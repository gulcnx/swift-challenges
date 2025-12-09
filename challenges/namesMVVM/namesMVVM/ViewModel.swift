//
// ViewModel.swift
// namesMVVM
//
// Created by gülçin çetin on 8.12.2025.
//

import Foundation
import SwiftUI

struct Person: Identifiable, Codable, Comparable, Hashable {
    var id = UUID()
    var name: String
    
    static func <(lhs: Person, rhs: Person)-> Bool {
        lhs.name < rhs.name
    }
}

class ViewModel: ObservableObject {
    @Published var names: [Person] = []
    private let jsonURL = URL.documentsDirectory.appending(path: "names.json")
    
    init() {
        load()
    }
    
    func save() {
        do{
            let encoded = try JSONEncoder().encode(names)
            try encoded.write(to: jsonURL)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func load() {
        if let data = try? Data(contentsOf: jsonURL),
           let decoded = try? JSONDecoder().decode([Person].self, from: data){ names = decoded.sorted() } }
    
    func delete(at offsets: IndexSet) {
        names.remove(atOffsets: offsets)
        save()
    }
}
