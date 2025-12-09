//
// AddView.swift
// namesMVVM
//
// Created by gülçin çetin on 8.12.2025.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Your Name", text: $name).padding()
            }
            .toolbar{
                Button("Done") {
                    let newName = name
                    let newPerson = Person(name: newName)
                    viewModel.names.append(newPerson)
                    viewModel.save()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
