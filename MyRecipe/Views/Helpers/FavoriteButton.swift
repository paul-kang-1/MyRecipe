//
//  FavoriteButton.swift
//  MyRecipe
//
//  Created by 강우상 on 12/6/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .orange : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
