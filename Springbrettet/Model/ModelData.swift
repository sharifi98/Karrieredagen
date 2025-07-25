//
//  ModelData.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import Foundation

var companies: [Company] = load("companyData.json")
var events: [Event] = load("scheduleData.json")
var springbrettereData: [Person] = load("springbrettereData.json")
var lederData: [Leder] = load("lederData.json")

final class ModelData: ObservableObject {
    @Published var companies: [Company] = load("companyData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
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

