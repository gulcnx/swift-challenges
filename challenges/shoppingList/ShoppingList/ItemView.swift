//
//  ItemView.swift
//  ShoppingList
//
//  Created by gülçin çetin on 29.10.2025.
//

import Foundation
import SwiftData
import SwiftUI

enum FilterType{
    case none, purchased, toBuy
}

struct ItemView: View {
    @Environment(\.modelContext) var modelContext
    var filterType: FilterType
    @Query var items: [Item]
    
    init(sortOrder: [SortDescriptor<Item>], filterType: FilterType = .none) {
        self.filterType = filterType
        let predicate: Predicate<Item>
        
        switch filterType {
        case .purchased:
            predicate = #Predicate {$0.purchased }
        case .toBuy:
            predicate = #Predicate {!$0.purchased }
        case .none:
            predicate = #Predicate { _ in true } // fetch all
        }
        _items = Query(filter: predicate, sort: sortOrder)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(String(format: "%.2f", item.price))
                        }
                        Spacer()
                        
                        VStack {
                            Text("Did I buy this yet?")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text(item.purchased == true ? "✅ Yes, i bought." : "🛒 Still in the waitlist.")
                        }
                        .onTapGesture {
                            item.purchased.toggle()
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
        }
    }
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset] // Find this item in our query
            modelContext.delete(item) // Delete it from context
        }
    }
}
