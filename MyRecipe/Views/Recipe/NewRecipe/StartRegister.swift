//
//  StartRegister.swift
//  MyRecipe
//
//  Created by 강우상 on 12/7/23.
//

import SwiftUI

struct StartRegister: View {
    @Environment(\.colorScheme) var colorScheme
    private var accentColor: Color {
        tintColor(colorScheme: colorScheme)
    }
    
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack (path: $navPath) {
            VStack(alignment: .leading) {
                GuideText()
                Spacer()
                NavigationLink {
                    RegisterName()
                } label: {
                    ProgressButton(label: "Next")
                        .padding()
                }
            }
            .tint(accentColor)
            .padding()
        }
    }
    
    struct GuideText: View {
        let necessaryFields: [String] = ["메뉴 이름", "재료 리스트", "요리법"]
        let optionalFields: [String] = ["사진", "소요 시간"]
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("레시피를 등록해 볼까요?")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                Text("다음 항목들이 필요해요!")
                    .bold()
                BulletedList(strings: necessaryFields)
                    .padding(.bottom)
                Text("있으면 좋아요!")
                    .bold()
                BulletedList(strings: optionalFields)
            }
            .padding()
        }
    }
}

#Preview {
    StartRegister()
}
