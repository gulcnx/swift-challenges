//
//  ContentView.swift
//  MemoryJournal
//
//  Created by gülçin çetin on 15.12.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var path = NavigationPath()
    @State private var showAddView = false
    @State private var photoData: Data?
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach(viewModel.memories) { memory in
                        HStack{
                            NavigationLink("\(memory.name)", value: memory)
                        
                            if let uiimage = viewModel.loadImage(memory.fileName) {
                                Image(uiImage: uiimage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteIndex(_:))
                }
            }
            .navigationDestination(for: Memory.self) { selection in
                DetailView(memory: selection, photoData: $photoData)
            }
            .onAppear(perform: viewModel.loadFromJSON)
            .sheet(isPresented: $showAddView) {
                AddView()
            }
            .navigationTitle("MemoryJournal")
            .toolbar {
                Button("", systemImage: "plus") {
                    showAddView = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
