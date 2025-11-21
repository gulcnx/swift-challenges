//
//  ContentView.swift
//  RandomCatFact
//
//  Created by gülçin çetin on 26.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("One Random Fact About Cats", destination: DetailView() )
                .navigationTitle("Random Facts 🐈🐱")
        }
    }
}

#Preview {
    ContentView()
}
