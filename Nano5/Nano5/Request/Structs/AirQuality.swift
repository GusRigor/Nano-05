//
//  AirQuality.swift
//  Nano5
//
//  Created by Gustavo Rigor on 22/02/21.
//Testado e Funcionando.

import Foundation

struct AirQuality: Decodable{
    var coord: Coord?
    var list: [node?]?
}

struct MainAir: Decodable{
    var aqi: Int?
}

struct Components: Decodable{
    var co: Float?
    var no: Float?
    var no2: Float?
    var o3: Float?
    var so2: Float?
    var pm2_5: Float?
    var pm10: Float?
    var nh3: Float?
}

struct node: Decodable{
    var main: MainAir?
    var components: Components?
    var dt: Int?
}
