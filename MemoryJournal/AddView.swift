//
//  AddView.swift
//  MemoryJournal
//
//  Created by gülçin çetin on 15.12.2025.
//

import SwiftUI
import PhotosUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: ViewModel
    @State var photoData: Data?
    @State private var name = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text(name).padding()
                
                PhotosPicker(selection: $selectedItem) {
                    if let photoData = photoData,
                       let uiimage = UIImage(data: photoData) {
                        Image(uiImage: uiimage)
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture has been selected.", systemImage: "nosign", description: Text("Please tap to select a picture."))
                    }
                }
                .buttonStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Done") {
                        if let photoData = photoData {
                            viewModel.saveImage(photoData, name)
                        }
                        dismiss()
                    }
                }
            }
            .alert("Give it a name", isPresented: $showAlert) {
                TextField("Write its name here", text: $name)
            }
            .onChange(of: selectedItem) {
                showAlert = true
    
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self){
                        photoData = data
                    }
                }
            }
        }
    }
}

#Preview {
    AddView()
}
