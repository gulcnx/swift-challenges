//
//  ContentView.swift
//  ShoppingList
//
//  Created by gülçin çetin on 29.10.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var items: [Item]
    @Environment(\.modelContext) var modelContext
    @State private var showAddView = false
    @State private var filterType: FilterType = .none
    @State private var sortOrder = [
        SortDescriptor(\Item.name),
        SortDescriptor(\Item.price)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ItemView(sortOrder: sortOrder, filterType: filterType)
            }
            .navigationTitle("Shopping List")
            .sheet(isPresented: $showAddView) {
                AddItem(items: items)
            }
            .toolbar {
                ToolbarItem {
                    Button("", systemImage: "plus") {
                        showAddView = true
                    }
                }
                ToolbarItem {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Select a filter", selection: $filterType) {
                            Text("Show All").tag(FilterType.none)
                            Text("Only Purchased Items").tag(FilterType.purchased)
                            Text("Still in Waitlist").tag(FilterType.toBuy)
                        }
                    }
                }
                ToolbarItem {
                    Menu("Sort", systemImage: "ellipsis") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name").tag(
                                [SortDescriptor(\Item.name),
                                 SortDescriptor(\Item.price)
                            ])
                            Text("Sort by price").tag(
                                [SortDescriptor(\Item.price),
                                 SortDescriptor(\Item.name)
                            ])
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
