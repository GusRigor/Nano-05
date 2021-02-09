import Foundation

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


func pesquisarQualidadeAr(_ lat: Float,_ lon: Float , completion: @escaping (AirQuality) -> Void) {
    guard let url = URL(string: "http://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=369991904c212bf42c5744c560d15b9c") else { return }
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


var str = "Hello, API"
print(str)
var i = 0
for i in 0...600{
    pesquisarQualidadeAr(-46.6361+Float(i),-23.5475) { (air) in
        print(air.coord.lat, i)
//        print(air.list.first!.main.aqi)
//        print(air.list.first!.components)
//        print(air.list.first!.dt)
    }
print(i)
}

pesquisarQualidadeAr(-46.6361,-23.5475) { (air) in
    print(air.coord.lat)
    print(air.list.first!.main.aqi)
    print(air.list.first!.components)
    print(air.list.first!.dt)
}
