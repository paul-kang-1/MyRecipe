//
//  RegisterIngredients.swift
//  MyRecipe
//
//  Created by 강우상 on 12/8/23.
//

import SwiftUI

struct RegisterIngredients: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("필요한 재료들을\n알려주세요!")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                AddIngredientRow()
                Spacer()
                NavigationLink {
                    RegisterSteps()
                } label: {
                    ProgressButton(label: "Next")
                        .padding()
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
    
    struct AddIngredientRow: View {
        var body: some View {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 30, height:30)
                        .foregroundStyle(.tertiary)
                    Image(systemName: "plus")
                        .foregroundStyle(.blue)
                }
                Text("재료 추가하기")
                    .font(.title3)
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterIngredients()
}
