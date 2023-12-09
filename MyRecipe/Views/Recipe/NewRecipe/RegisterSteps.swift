//
//  RegisterSteps.swift
//  MyRecipe
//
//  Created by 강우상 on 12/8/23.
//

import SwiftUI

struct RegisterSteps: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("어떻게 만드나요?")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
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
}

#Preview {
    RegisterSteps()
}
