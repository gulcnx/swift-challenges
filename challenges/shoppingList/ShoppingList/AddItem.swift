//
//  AddItem.swift
//  ShoppingList
//
//  Created by gülçin çetin on 29.10.2025.
//

import Foundation
import SwiftUI

struct AddItem: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name = ""
    @State private var price = 0.0
    @State private var purchased = false
    
    var items: [Item]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type its name here...", text: $name)
                    .padding()
                TextField("Type its price here...", value: $price, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                    .padding()
                Toggle("Did I purchased it yet?", isOn: $purchased)
                    .padding()
                    .tint(.blue)
            }
            
            .toolbar{
                ToolbarItem {
                    Button("Save") {
                        let newItem = Item(name: name, price: price, purchased: purchased)
                        modelContext.insert(newItem)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}
