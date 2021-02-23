//
//  Requests.swift
//  GPS
//
//  Created by Rafael Costa on 09/02/21.
//

import Foundation

//Air Pollution

//
//struct MainAir: Decodable{
//    var aqi: Int
//}
//
//struct Components: Decodable{
//    var co: Float
//    var no: Float
//    var no2: Float
//    var o3: Float
//    var so2: Float
//    var pm2_5: Float
//    var pm10: Float
//    var nh3: Float
//}
//
//struct node: Decodable{
//    var main: MainAir
//    var components: Components
//    var dt: Int
//}
//
//struct AirQuality: Decodable{
//    var coord: Coord
//    var list: [node]
//}

class PollutionAPI{
    class func pesquisarQualidadeAr(_ lat: Float,_ lon: Float , completion: @escaping (WeatherForecast) -> Void) {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=-23.5475&lon=-46.6361&&exclude=minutely,hourly,alerts&appid=369991904c212bf42c5744c560d15b9c") else { return }
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
}
