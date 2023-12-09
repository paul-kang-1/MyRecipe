//
//  LineTextField.swift
//  MyRecipe
//
//  Created by 강우상 on 12/8/23.
//

import SwiftUI

struct LineTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .overlay(BottomBorder().stroke(.orange, lineWidth: 1))
                .autocorrectionDisabled()
        }
    }
}

struct BottomBorder: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        return path
    }
}

#Preview {
    LineTextField(text: .constant(""), placeholder: "Here")
}
