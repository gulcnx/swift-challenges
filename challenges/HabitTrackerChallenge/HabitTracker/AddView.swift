//
//  AddView.swift
//  HabitTracker
//
//  Created by gülçin çetin on 28.08.2025.
//

import SwiftUI

struct AddView : View {
    @Environment(\.dismiss) var dismiss
    
    @State private var activiteName = ""
    @State private var timeSpent = 0
    
    var hob : Hobbies
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Which activite would you like to tracK?", text: $activiteName)
                Stepper("\(timeSpent) many hours spent", value: $timeSpent, step: 1)
            }
            .navigationTitle("Add New Hobby")
            .toolbar{
                ToolbarItem(placement: .topBarLeading ){
                    Button("Dismiss"){
                        dismiss()
                    }.foregroundStyle(.red)
                }
                ToolbarItem{
                    Button("Save") {
                        let hobby = HobbyItem(hobbyName: activiteName, spentTime: timeSpent)
                        hob.hobbies.append(hobby)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview{
    AddView(hob: Hobbies())
}
