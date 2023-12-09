//
//  AddTitle.swift
//  MyRecipe
//
//  Created by 강우상 on 12/7/23.
//

import SwiftUI

struct RegisterName: View {
    @State private var inputName = ""
    
    @Environment(\.colorScheme) var colorScheme
    private var accentColor: Color {
        tintColor(colorScheme: colorScheme)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("메뉴 이름이 뭔가요?")
                    .font(.title)
                    .bold()
                    .padding()
                Rectangle()
                    .frame(height: 200)
                    .foregroundStyle(.clear)
                LineTextField(text: $inputName, placeholder: "이름을 알려주세요!")
                    .padding(.horizontal)
                Spacer()
                NavigationLink {
                    RegisterIngredients()
                } label: {
                    ProgressButton(label: "Next")
                        .padding()
                }
                .disabled(inputName.isEmpty)
            }
            Spacer()
        }
        .padding()
        .tint(accentColor)
    }
}

#Preview {
    RegisterName()
}
