//
//  MemoryJournalApp.swift
//  MemoryJournal
//
//  Created by gülçin çetin on 20.12.2025.
//

import Combine
import SwiftUI

@main
struct MemoryJournalApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
