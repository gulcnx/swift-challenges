//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by gülçin çetin on 29.10.2025.
//

import SwiftUI
import SwiftData

@main
struct ShoppingListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
