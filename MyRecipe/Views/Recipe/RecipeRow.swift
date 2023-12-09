//
//  RecipeRow.swift
//  MyRecipe
//
//  Created by 강우상 on 12/2/23.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            HStack (alignment: .center) {
                thumbnail
                textCorner
            }
        }
    }
    
    var thumbnail: some View {
        ZStack (alignment: .topLeading) {
            recipe.image
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            if recipe.isFavorite {
                ZStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .opacity(0.8)
                    Image(systemName: "star.fill")
                        .foregroundStyle(.orange)
                }
                .padding(.leading, 5)
                .padding(.top, 5)
                .shadow(radius: 5)
            }
        }
    }
    
    var textCorner: some View {
        VStack (alignment: .leading) {
            Text(recipe.name)
                .font(.title2)
                .bold()
            HStack (spacing: 2.5) {
                Image(systemName: "clock")
                Text(recipe.totalTimeString)
                Spacer()
            }
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.leading, 5)
    }
}

#Preview {
    let recipes = ModelData().recipes
    return RecipeRow(recipe: recipes[2])
}
