import Foundation

struct AirQuality: Decodable{
    var coord: Coord
    var list: [node]
}

struct MainAir: Decodable{
    var aqi: Int
}

struct Components: Decodable{
    var co: Float
    var no: Float
    var no2: Float
    var o3: Float
    var so2: Float
    var pm2_5: Float
    var pm10: Float
    var nh3: Float
}

struct node: Decodable{
    var main: MainAir
    var components: Components
    var dt: Int
}


struct WeatherFcc: Decodable{
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

struct Coord : Decodable{
    var lon: Float
    var lat: Float
}

struct Weather : Decodable{
    var id: Int
    var main: String
    var description: String
    var icon: String?
}

struct MainTemp : Decodable {
    var temp: Float
    var feels_like: Float?
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
    
}

struct Wind : Decodable {
    var speed: Float
    var deg: Int
}

struct Clouds: Decodable {
    var all: Int
}

struct Sys: Decodable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct WeatherForecast: Decodable {
    var lat: Float
    var lon: Float
    var timezone: String
    var timezone_offset: Int
    var current: Current
    var daily: [Daily]
}

struct Current: Decodable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Float
    var feels_like: Float
    var presssure: Int
    var humidity: Int
    var dew_point: Float
    var uvi: Float
    var clouds: Int
    var visibility: Int
    var wind_speed: Float
    var wind_deg: Int
    var weather: [Weather]
}

struct Daily: Decodable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: TempDay
    var feels_like: Feels_like
    var pressure: Int
    var humidity: Int
    var dew_point: Float
    var wind_speed: Float
    var wind_deg: Int
    var weather: [Weather]
    var clouds: Int
    var pop: Float
    var rain: Float
    var uvi: Float
}

struct TempDay: Decodable {
    var day: Float
    var min: Float
    var max: Float
    var night: Float
    var eve: Float
    var morn: Float
}

struct Feels_like: Decodable {
    var day: Float
    var night: Float
    var eve: Float
    var morn: Float
}







func pesquisarQualidadeAr(_ lat: Float,_ lon: Float , completion: @escaping (WeatherForecast) -> Void) {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&&exclude=minutely,hourly,alerts&appid=369991904c212bf42c5744c560d15b9c") else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error == nil {
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                
                guard let data = data else { return }
                do {
                    let airQuality = try JSONDecoder().decode(WeatherForecast.self, from: data)
                    completion(airQuality)
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print("Status inválido do servidor, Status Code: \(response.statusCode)")
            }
        } else {
            print(error!.localizedDescription)
        }
    }.resume()
}


var str = "Hello, API"
print(str)

pesquisarQualidadeAr(37.7858,-122.4064) { (air) in
    print(air.lat)
    print(air.current)
    print(air.daily)
//    print(air.list.first!.main.aqi)
//    print(air.list.first!.components)
//    print(air.list.first!.dt)
}
//print("Bla")
