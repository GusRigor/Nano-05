//
//  WeatherGeoRequest.swift
//  Nano5
//
//  Created by Gustavo Rigor on 23/02/21.
//

import Foundation

class WeatherGeoRequest{
    class func pesquisarTempo(_ lat: Float,_ lon: Float , completion: @escaping (WeatherFcc) -> Void) {
        guard let url = URL(string:"https://fcc-weather-api.glitch.me/api/current?lat=\(lat)&lon=\(lon)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    
                    guard let data = data else { return }
                    do {
                        let airQuality = try JSONDecoder().decode(WeatherFcc.self, from: data)
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
