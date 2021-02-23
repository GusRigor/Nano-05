//
//  Forecast.swift
//  GPS
//
//  Created by Gustavo Rigor on 23/02/21.
//

import Foundation

struct WeatherForecast: Decodable {
    var lat: Float?
    var lon: Float?
    var timezone: String?
    var timezone_offset: Int?
    var current: Current?
    var daily: [Daily]?
}

struct Current: Decodable {
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: Float?
    var feels_like: Float?
    var presssure: Int?
    var humidity: Int?
    var dew_point: Float?
    var uvi: Float?
    var clouds: Int?
    var visibility: Int?
    var wind_speed: Float?
    var wind_deg: Int?
    var weather: [Weather?]?
}

struct Daily: Decodable {
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: TempDay?
    var feels_like: Feels_like?
    var pressure: Int?
    var humidity: Int?
    var dew_point: Float?
    var wind_speed: Float?
    var wind_deg: Int?
    var weather: [Weather]?
    var clouds: Int?
    var pop: Float?
    var rain: Float?
    var uvi: Float?
}

struct TempDay: Decodable {
    var day: Float?
    var min: Float?
    var max: Float?
    var night: Float?
    var eve: Float?
    var morn: Float?
}

struct Feels_like: Decodable {
    var day: Float?
    var night: Float?
    var eve: Float?
    var morn: Float?
}

struct Weather : Decodable{
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}
