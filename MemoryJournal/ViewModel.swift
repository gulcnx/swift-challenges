//
//  ViewModel.swift
//  MemoryJournal
//
//  Created by gülçin çetin on 15.12.2025.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var memories: [Memory] = []
    
    private var jsonURL = URL.documentsDirectory.appending(path: "memories.json")
    
    init(){
        loadFromJSON()
    }

    //Load And Save as JSON
  
    func saveToJSON(){
        if let data = try? JSONEncoder().encode(memories){
            try? data.write(to: jsonURL)
        }
    }
    
    func loadFromJSON(){
        if let data = try? Data(contentsOf: jsonURL),
           let decoded = try? JSONDecoder().decode([Memory].self, from: data){
               memories = decoded.sorted()
           }
    }
    
    // Save image 
    
    func saveImage(_ photoData: Data?, _ name:String){
        // take the image as raw data
        // convert it to jpeg file
        // save the file to documents directory
            
        let fileName = UUID().uuidString + ".jpeg"
        let url = URL.documentsDirectory.appending(path: fileName)
        try? photoData?.write(to: url)

        // create a Memory object, Append it to memories, Then save JSON; so list can appear
        let newMemory = Memory(name: name, fileName: fileName)
        memories.append(newMemory)
        memories.sort()
        
        saveToJSON()
    }
    
    // Load image
    
    func loadImage(_ fileName: String) -> UIImage? {
        // find jpeg file by fileName
        // check if we can read the file
        // load the image by fileName else return nil
        
        let url = URL.documentsDirectory.appending(path: fileName)
        if let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            return image
        }
        return nil
    }
    
    // ❗️ Find the memory in the list that matches the edited one, replace it with the new version, then save everything.
    
    func updateMemory(_ updated: Memory) {
        if let index = memories.firstIndex(where: { $0.id == updated.id }) {
            memories[index] = updated
            memories.sort()
            saveToJSON()
        }
    }
    
    // Delete from list
    
    func deleteIndex(_ indexSet: IndexSet) {
        for index in indexSet {
            let memory = memories[index]
            delete(memory.fileName)
        }
        memories.remove(atOffsets: indexSet)
        saveToJSON()
    }
    
    
    // Delete image
    
//    func delete(_ fileName: String){
//        // find the file by fileName
//        // remove it.
//        
//        let url = URL.documentsDirectory.appending(path: fileName)
//        try? FileManager.default.removeItem(at: url)
//    }
    
    // Better Version:
    func delete(_ fileName: String) {
        let url = URL.documentsDirectory.appending(path: fileName)
        
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                print("❌ Failed to delete file:", error.localizedDescription)
            }
        } else {
            print("⚠️ File not found on disk:", fileName)
        }
    }

    
}

struct Memory: Identifiable, Comparable, Hashable, Codable {
    var id = UUID()
    var name: String
    var fileName: String
    
    static func <(lhs: Memory, rhs: Memory) -> Bool {
        lhs.name < rhs.name
    }
}
