//
//  Ingredients.swift
//  RecipeApp
//
//  Created by gülçin çetin on 3.09.2025.
//

import SwiftUI

struct Ingredients: View {
    var meal: Meals
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<meal.ingredients.count, id:\.self){ index in
                    HStack {
                        Image(systemName: "circle")
                        Text("\(meal.ingredients[index])")
                            .font(.title)
                    }
                }
            }
                .navigationTitle("\(meal.mealName)")
        }
    }
}

#Preview {
    Ingredients(meal: Meals(mealName: "", description: "", ingredients: ["",""]))
}
