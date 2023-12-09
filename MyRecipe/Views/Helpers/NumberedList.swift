//
//  NumberedList.swift
//  MyRecipe
//
//  Created by 강우상 on 12/6/23.
//

import SwiftUI

struct NumberedList: View {
    let strings: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(strings.enumerated()), id: \.offset) { index, string in
                HStack (alignment: .top) {
                    Text("\(index + 1). ")
                        .foregroundColor(.gray)
                    Text(string)
                }
            }
        }
    }
}

#Preview {
    let test = ["a", "b", "c"]
    return NumberedList(strings: test)
}
