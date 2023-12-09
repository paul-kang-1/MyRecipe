//
//  Unit.swift
//  MyRecipe
//
//  Created by 강우상 on 11/27/23.
//

import Foundation

// TODO: Add weight units
enum MetricVolumeUnit: String {
    case milliliters = "ml"
    case liters = "L"
}

enum USVolumeUnit: String {
    case fluidOunces = "fl.oz"
    case PaperCups = "P.Cups"
    case Cups = "Cups"
    case pints = "Pints"
    case quarts = "qt."
    case gallons = "gal."
}

struct MeasureMent {
    var type: MeasurementType
    var isMetric: Bool
    var value: Double
    
    enum MeasurementType {
        case volume, weight
    }
}
