//
//  RecipeDetail.swift
//  MyRecipe
//
//  Created by 강우상 on 12/3/23.
//

import SwiftUI

struct RecipeDetail: View {
    @Environment(ModelData.self) var modelData
    var recipe : Recipe
    var recipeIndex: Int {
        modelData.recipes.firstIndex(where: { $0.id == recipe.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                recipe.image
                    .resizable()
                    .scaledToFill()
                recipeSummary
            }
        }
    }
    
    var recipeSummary: some View {
        @Bindable var modelData = modelData
        
        return VStack (alignment: .leading) {
            HStack {
                Text(recipe.name)
                    .font(.title)
                Spacer()
                FavoriteButton(isSet: $modelData.recipes[recipeIndex].isFavorite)
            }
            RecipeDetail("Serving", String(recipe.serving))
            RecipeDetail("Time", recipe.totalTimeString)
            Divider()
            IngredientsSection(recipe.ingredients)
            Divider()
            StepsSection(steps: recipe.steps)
        }
        .padding(.horizontal)
    }
    
    struct StepsSection: View {
        let steps: [String]
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Steps")
                    .bold()
                NumberedList(strings: steps)
            }
            
        }
    }
    
    func IngredientsSection(_ ingredients: [Recipe.Ingredient]) -> some View {
        VStack (alignment: .leading) {
            Text("Ingredients")
                .bold()
            BulletedList(strings: ingredients.map { $0.quantity + " " + $0.name })
        }
    }
    
    func RecipeDetail(_ property: String, _ value: String) -> some View {
        HStack {
            Text(property)
                .bold()
            Text(value)
        }
        .font(.subheadline)
    }
}

#Preview {
    let modelData = ModelData()
    return RecipeDetail(recipe: modelData.recipes[0])
        .environment(ModelData())
}
