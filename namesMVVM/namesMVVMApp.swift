//
//  namesMVVMApp.swift
//  namesMVVM
//
//  Created by gülçin çetin on 8.12.2025.
//

import SwiftUI

@main
struct namesMVVMApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
