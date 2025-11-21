//
//  ContentView.swift
//  BoredAPI
//
//  Created by gülçin çetin on 25.09.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var activity = Activity()
    
    var body: some View {
        NavigationStack{
            NavigationLink("❇️ Random Activity ", destination: DetailView(activity: activity))
                .navigationTitle("Random Activities")
        }.task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(Activity.self, from: data)
            activity = decodedData   // triggers UI update ✅
        } catch {
            print("Error: \(error)")
        }
    }
}

