//
//  WeatherOpen.swift
//  Nano5
//
//  Created by Gustavo Rigor on 22/02/21.
//

import Foundation

struct WeatherOpen: Decodable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: MainTemp
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}
