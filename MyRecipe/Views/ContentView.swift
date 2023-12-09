//
//  ContentView.swift
//  MyRecipe
//
//  Created by 강우상 on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    private var tabBarBackgroundColor: Color {
        colorScheme == .light ? .white : .clear
    }
    
    var body: some View {
        TabView  {
            RecipeList()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("My Recipes")
                }
                .toolbarBackground(tabBarBackgroundColor, for: .tabBar)
            StartRegister()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add recipe")
                }
                .toolbarBackground(tabBarBackgroundColor, for: .tabBar)
            Settings()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .toolbarBackground(tabBarBackgroundColor, for: .tabBar)
        }
        .tint(colorScheme == .light ? .black : .white)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
