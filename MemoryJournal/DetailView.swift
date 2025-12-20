//
//  DetailView.swift
//  MemoryJournal
//
//  Created by gülçin çetin on 15.12.2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: ViewModel
    @State private var uiimage: UIImage?
    @State private var edit = false
    @State var memory: Memory
    @Binding var photoData: Data?
    
    var body: some View {
        VStack{
            Text("\(memory.name)").padding()
            
            if let image = uiimage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ContentUnavailableView("No picture to display", systemImage: "nosign")
            }
        }
        .alert("Re-Name", isPresented: $edit) {
            TextField("Re-naming..", text: $memory.name)
        }
        .toolbar {
            ToolbarItem{
                Button("Edit") {
                    edit = true
                }
            }
            ToolbarItem {
                Button("Save Changes") {
                    viewModel.updateMemory(memory)
                    dismiss()
                }
            }
        }
        .onAppear {
            uiimage = viewModel.loadImage(memory.fileName)
        }
    }
}
