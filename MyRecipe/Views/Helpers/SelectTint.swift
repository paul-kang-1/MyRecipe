//
//  SelectTint.swift
//  MyRecipe
//
//  Created by 강우상 on 12/7/23.
//

import Foundation
import SwiftUI

func tintColor(colorScheme: ColorScheme) -> Color {
    return colorScheme == .light ? .black : .white
}
