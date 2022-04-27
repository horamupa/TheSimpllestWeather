//
//  WeatherData.swift
//  TheSimpllestWeather
//
//  Created by M on 26.04.2022.
//

import UIKit

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    }

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}


