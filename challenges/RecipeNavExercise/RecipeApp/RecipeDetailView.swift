//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by gülçin çetin on 3.09.2025.
//

import SwiftUI

struct RecipeDetailView: View {
    var meal: Meals
    
    var body: some View {
        VStack{
            NavigationStack{
                Text(meal.description).font(.title).padding()
                        NavigationLink("Ingredients"){
                            Ingredients(meal: meal)
                        }
            .navigationTitle("\(meal.mealName)")
            .toolbar {
                Button("",systemImage: "plus") {
                        
                  }
               }
            }
        }
    }
}

#Preview {
    RecipeDetailView(meal: Meals(mealName: "Pasta", description: "meals description", ingredients: ["i","ngredients"]))
}
