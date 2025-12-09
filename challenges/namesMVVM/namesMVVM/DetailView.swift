//
// DetailView.swift
// namesMVVM
//
// Created by gülçin çetin on 8.12.2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    @State var person: Person
    @State private var edit = false
    
    var body: some View {
        VStack{
            Text(person.name)
                .font(.largeTitle.bold())
        }
        .alert("Edit Name", isPresented: $edit) {
            TextField("Type here...", text: $person.name)
        }
        .toolbar {
            ToolbarItem{
                Button("Edit") {
                edit = true }
            }
            
            ToolbarItem {
                Button("Save"){
                // ❗️❗️❗️
                if let index = viewModel.names.firstIndex(where: { $0.id == person.id }) {
                    viewModel.names[index].name = person.name
                    viewModel.save()
                }
                dismiss()
            }
          }
        }
    }
}
