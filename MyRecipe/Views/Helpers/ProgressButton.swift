//
//  ProgressButton.swift
//  MyRecipe
//
//  Created by 강우상 on 12/7/23.
//

import SwiftUI

struct ProgressButton: View {
    let label: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
                .shadow(radius: 5)
            Text(label)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ProgressButton(label: "Next")
}
