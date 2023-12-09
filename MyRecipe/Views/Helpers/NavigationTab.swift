//
//  NavigationTab.swift
//  MyRecipe
//
//  Created by 강우상 on 12/7/23.
//

import SwiftUI

struct NavigationTab: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNameSpace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("house", "Recipes"),
        ("plus", "Add Recipe"),
        ("gear", "Settings")
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 70)
                .foregroundStyle(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            
            HStack (alignment: .bottom) {
                ForEach(0..<tabBarItems.count, id: \.self) { index in
                    Button {
                        tabSelection = index
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            Image(systemName: tabBarItems[index].image)
                            Text(tabBarItems[index].title)
                                .font(.caption)
                            
                            if index == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .offset(y: 4)
                                    .foregroundStyle(.blue)
                                    .matchedGeometryEffect(id: "SelectedTabID"  , in: animationNameSpace)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .offset(y: 4)
                                    .foregroundStyle(.clear)
                            }
                        }
                        .foregroundStyle(index == tabSelection ? .blue: .gray)
                    }
                }
            }
            .frame(height: 70)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationTab(tabSelection: .constant(0))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
