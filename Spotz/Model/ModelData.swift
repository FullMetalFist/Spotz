//
//  ModelData.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
//

import Foundation

@Observable
class ModelData {
    var spotz: [Spot] = load("parkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var visits: [Spot] {
        spotz.filter { $0.hasVisited }
    }
    
    var categories: [String: [Spot]] {
        Dictionary(
            grouping: spotz,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
