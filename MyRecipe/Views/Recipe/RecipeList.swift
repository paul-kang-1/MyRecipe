//
//  RecipeList.swift
//  MyRecipe
//
//  Created by 강우상 on 12/2/23.
//

import SwiftUI

struct RecipeList: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.colorScheme) var colorScheme
    private var accentColor: Color {
        tintColor(colorScheme: colorScheme)
    }
    
    @State private var searchTerm = ""
    @State private var showFavoritesOnly = false
    
    var filteredRecipes: [Recipe] {
        let favoriteFilteredRecipes = modelData.recipes.filter { recipe in
            (!showFavoritesOnly || recipe.isFavorite)
        }
        guard !searchTerm.isEmpty else { return favoriteFilteredRecipes }
        return favoriteFilteredRecipes.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            NavigationSplitView {
                List {
                    ForEach(filteredRecipes) { recipe in
                        ZStack (alignment: .leading) {
                            NavigationLink {
                                RecipeDetail(recipe: recipe)
                            } label: {
                                EmptyView()
                            }
                            .opacity(0.0)
                            .buttonStyle(PlainButtonStyle())
                            RecipeRow(recipe: recipe)
                        }
                        .padding(.vertical, 10)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .navigationTitle("Your Recipes")
                .scrollContentBackground(.hidden)
            } detail: {
                Text("Select a recipe")
            }
            .tint(accentColor)
            .searchable(text: $searchTerm, prompt: "Looking for a menu?")
            HomeFavoriteButton(isSet: $showFavoritesOnly)
                .padding()
        }
    }
    
    struct HomeFavoriteButton: View {
        @Binding var isSet: Bool
        
        var body: some View {
            Button {
                isSet.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 55)
                        .foregroundStyle(.white)
                        .shadow(radius: 3)
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(isSet ? .orange : .gray)
                        .frame(width:30)
                }
            }
        }
    }
    
}

#Preview {
    RecipeList()
        .environment(ModelData())
}
