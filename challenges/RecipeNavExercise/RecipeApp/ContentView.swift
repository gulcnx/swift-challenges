//
//  ContentView.swift
//  RecipeApp
//
//  Created by gülçin çetin on 3.09.2025.
//

import SwiftUI

struct Meals: Hashable {
    var id = UUID()
    var mealName: String
    var description: String
    var ingredients: [String]
}

struct ContentView: View {
    
    @State var meals = [
        Meals(mealName: "Pasta", description: "Its Pasta's description", ingredients: ["Row Pasta", "Hot Water", "Salt", "Oil"]),
        Meals(mealName: "Pizza", description: "It's Pizza's Description", ingredients: ["Doug", "Mushroom", "Pepperoni","Tomato", "Oil"]),
        Meals(mealName: "Salad", description: "It's description about salad", ingredients: ["tomato", "cucumber" ,"onion","oil"])
    ]
    
    var body: some View {
        NavigationStack {
            List(meals, id: \.self) { meal in
                NavigationLink("\(meal.mealName)") {
                    RecipeDetailView(meal: meal)
                }
            }
            .navigationTitle("Recipes 🍽️")
        }
    }
}

#Preview {
    ContentView()
}
