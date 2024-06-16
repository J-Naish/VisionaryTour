//
//  Functions.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/19.
//

import Foundation

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


enum FilterCase {
    case region(Region)
    case category(Category)
}

func filterLandmarks(landmarks: [Landmark], by filterCase: FilterCase) -> [Landmark] {
    switch filterCase {
    case .region(let region):
        return landmarks.filter { $0.country.region == region }
    case .category(let category):
        return landmarks.filter { $0.categories.contains(category) }
    }
}

func convertToLowerCaseWithUnderscore(_ input: String) -> String {
    return input.lowercased().replacingOccurrences(of: " ", with: "_")
}
