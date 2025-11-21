//
//  DetailView.swift
//  RandomCatFact
//
//  Created by gülçin çetin on 26.09.2025.
//

import SwiftUI

struct DetailView: View {
    @State private var fact = Facts()
    
    var body: some View {
        NavigationStack{
            Text("😸").font(.largeTitle)
            Text(fact.fact).padding().border(.cyan).padding()
        }.task {
            await loadData()
        }
    }
    func loadData() async {
        if fact.fact != "" {
                guard let url = URL(string: "https://catfact.ninja/fact") else {
                    print("Invalid URL")
                    return
                }
                
                do{
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let decodedData = try? JSONDecoder().decode(Facts.self, from: data) {
                        fact = decodedData
                    }
                }catch {
                    print("Invalid Data")
            }
            }
    }
}
