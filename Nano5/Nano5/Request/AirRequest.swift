//
//  AirRequest.swift
//  Nano5
//
//  Created by Gustavo Rigor on 23/02/21.
//

import Foundation

class AirRequest{
    class func pesquisarQualidadeAr(_ lat: Float,_ lon: Float , completion: @escaping (AirQuality) -> Void) {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&lang=pt_br&appid=") else { return }
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
