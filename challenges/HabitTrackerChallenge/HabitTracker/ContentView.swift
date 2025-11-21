//
//  ContentView.swift
//  HabitTracker
//
//  Created by gülçin çetin on 28.08.2025.
//

import SwiftUI

struct HobbyItem: Codable, Hashable {
    var id = UUID()
    let hobbyName: String
    let spentTime: Int
}

@Observable
class Hobbies {
    var hobbies = [HobbyItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(hobbies) {
                UserDefaults.standard.set(encoded, forKey: "Hobbies")
            }
        }
    }
    init() {
        if let savedHobbies = UserDefaults.standard.data(forKey: "Hobbies") {
            if let decodedHobbies = try? JSONDecoder().decode([HobbyItem].self, from: savedHobbies) {
                hobbies = decodedHobbies
                return
            }
        }
        hobbies = []
    }
}

struct ContentView: View {
    @State private var instance = Hobbies()
    @State private var showAddPage = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(instance.hobbies, id: \.self) { hobby in
                    VStack(alignment: .leading) {
                       
                        NavigationLink(){
                            VStack(alignment: .leading){
                                Text(" Hobby name is _\(hobby.hobbyName)_")
                                    .font(.headline)
                                Text("_\(hobby.spentTime) many hours_ spent.")
                                    .font(.headline)
                            }
                        } label: {
                            VStack(alignment: .leading) {
                                Text("\(hobby.hobbyName)")
                                    .bold()
                                    .font(.title2)
                                Text("Click here to see details")
                                    .font(.headline)
                            }
                        }
                    }
                }
                .onDelete(perform: removeHobby)
            }
            .toolbar{
                Button("", systemImage: "plus") {
                    showAddPage = true
                }
            }
                .sheet(isPresented: $showAddPage) {
                    AddView(hob: instance)
                }
                .navigationTitle("Habit Tracker")
            }
        }
    
    func removeHobby(at offsets: IndexSet) {
        instance.hobbies.remove(atOffsets : offsets)
    }
}

#Preview {
    ContentView()
}
