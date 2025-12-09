//
//  namesMVVMApp.swift
//  namesMVVM
//
//  Created by gülçin çetin on 9.12.2025.
//

import SwiftUI

@main
struct namesMVVMApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
