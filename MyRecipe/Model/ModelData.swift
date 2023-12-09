//
//  ModelData.swift
//  MyRecipe
//
//  Created by 강우상 on 12/2/23.
//

import Foundation

@Observable
class ModelData {
    var recipes: [Recipe] = load("mockData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // Build file URL from provided filename
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // Fetch data from the obtained URL
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // Try parsing the provided file with JSONDecoder
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
