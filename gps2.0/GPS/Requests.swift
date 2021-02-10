//
//  Requests.swift
//  GPS
//
//  Created by Rafael Costa on 09/02/21.
//

import Foundation

//Air Pollution
struct Coord: Decodable{
    var lon: Float
    var lat: Float
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

struct AirQuality: Decodable{
    var coord: Coord
    var list: [node]
}

class PollutionAPI{
    class func pesquisarQualidadeAr(_ lat: Float,_ lon: Float , completion: @escaping (AirQuality) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=63553d4c256b435406eb207df8920fe0") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    
                    guard let data = data else { return }
                    do {
                        let airQuality = try JSONDecoder().decode(AirQuality.self, from: data)
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
}
