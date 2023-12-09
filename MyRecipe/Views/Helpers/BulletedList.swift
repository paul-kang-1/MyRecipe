//
//  BulletedList.swift
//  MyRecipe
//
//  Created by 강우상 on 12/6/23.
//

import SwiftUI

struct BulletedList: View {
    let strings: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(strings, id: \.self) { string in
                HStack {
                    Text("• ")
                    Text(string)
                }
            }
        }
    }
}

#Preview {
    let test = ["a", "b", "c"]
    return BulletedList(strings: test)
}
