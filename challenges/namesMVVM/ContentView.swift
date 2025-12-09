//
//  ContentView.swift
//  namesMVVM
//
//  Created by gülçin çetin on 8.12.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var path = NavigationPath()
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                List {
                    ForEach(viewModel.names) { person in
                        NavigationLink("\(person.name)", value: person)
                    }
                    // ❗️ ❗️ ❗️
                    .onDelete{ offsets in
                        viewModel.delete(at: offsets)
                    }
                }
            }
            .onChange(of: viewModel.names){
                viewModel.names.sort()
            }
            .navigationDestination(for: Person.self) { selection in
                DetailView(person: selection)
            }
            .sheet(isPresented: $showAddView) {
                AddView()
            }
            .toolbar{
                Button("", systemImage: "plus") {
                    showAddView = true
                }
            }
            .navigationTitle("Save Names")
            .onAppear {
                viewModel.load()
            }
        }
    }
}

#Preview {
    ContentView()
}
