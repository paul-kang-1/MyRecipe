//
//  Recipe.swift
//  MyRecipe
//
//  Created by 강우상 on 11/27/23.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var serving: Int
    var ingredients: [Ingredient]
    var steps: [String] = []
    var isFavorite: Bool
    
    private var timers: [Int]
    var totalTimeString: String {
        let totalTime = timers.reduce(0, +)
        let hours = totalTime / 60
        let minutes = totalTime % 60
        var hoursStr: String
        if hours == 0 {
            hoursStr = ""
        } else {
            hoursStr = String(hours) + "h"
        }
        var minutesStr: String
        if minutes == 0 {
            minutesStr = ""
        } else {
            minutesStr = String(minutes) + "m"
        }
        return hoursStr != "" ? hoursStr + " " + minutesStr : minutesStr
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    struct Ingredient: Hashable, Codable {
        var name: String
        var quantity: String
        var type: String
    }
}
