//
//  ModelData.swift
//  WeatherProject
//
//  Created by Gülsüm Demirbaş on 16.05.2024.
//

import Foundation
var previewWeather :ResponseBody = load("weatherData.json")

func load<T : Decodable>(_ filename: String)-> T{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("File not found")
    }
    
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("File not found")
    }
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("File not found")
    }
}

