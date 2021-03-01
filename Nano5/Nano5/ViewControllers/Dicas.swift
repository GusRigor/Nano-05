//
//  Dicas.swift
//  Nano5
//
//  Created by Caroline Viana on 01/03/21.
//

import Foundation
import UIKit

class Dicas {
    
    class func gerarDica(tempo: WeatherForecast) -> String{
        var escolha = ["", ""]
        escolha.removeAll()
        
        if (tempo.daily?.first??.pop)! > 0.8 {
            escolha.append("Não se esqueça do guarda-chuva! :)")
            escolha.append("Coloque sua capa de chuva na mochila, pode acabar precisando :)")
        }
        if Int(tempo.current!.humidity!) < 40 {
            escolha.append("Não se esqueça de beber bastante água! :)")
            escolha.append("Hidrate-se! O tempo está seco :)")

        }
        if (tempo.daily?.first??.feels_like?.eve)! < 15.0 {
            escolha.append("Não se esqueça de levar uma blusa, se for sair mais tarde! :)")
            escolha.append("Leve uma blusa, pode esfriar :)")

        }
        if (tempo.daily?.first??.feels_like?.day)! > 30.0 {
            escolha.append("Não se esqueça de se hidratar nesse calor :)")
            escolha.append("Um sorvete cairia muito bem! :)")
        }
        
        if !escolha.isEmpty {return escolha.randomElement() ?? "Beba água :)"}
        
        switch tempo.current?.weather?.first??.main {
        case "Thunderstorm":
            escolha.append("Evite deixar aparelhos elétricos ligados na tomada :)")
            escolha.append("Se proteja, e não fique em áreas abertas :)")
            break
        case "Drizzle":
            escolha.append("Não se esqueça do guarda-chuva! :)")
            escolha.append("Um chocolate quente cairia muito bem! :)")
            break
        case "Rain":
            escolha.append("Não se esqueça do guarda-chuva! :)")
            escolha.append("Um chocolate quente cairia muito bem! :)")
            break
        case "Snow":
            escolha.append("Não se esqueça de vestir seus casacos! :)")
            escolha.append("Cuidado pra não escorregar no gelo :)")
            break
        case "Mist":
            escolha.append("A visibilidade está baixa. Cuidado ao dirigir :)")
            escolha.append("Nevoeiro quando baixa, o sol racha :)")
            break
        case "Clear":
            escolha.append("Um ótimo dia para passear no parque :)")
            if Conversores.UnixParaDate(UNIX: (tempo.current?.dt)!, diaMes: false) < "17:00"{
                escolha.append("Não esqueça de passar protetor solar :)")
            }
            else {
                escolha.append("Hoje dá pra ver as estrelas! :D")
            }
            break
        case "Clouds":
            escolha.append("O clima está ótimo para uma caminhada :)")
            break
        default:
            break
        }
        
        return escolha.randomElement() ?? "Beba água :)"
    }
    
    class func gerarDica(tempo: WeatherOpen) -> String{
        var escolha = ["", ""]
        escolha.removeAll()
        
        if Int(tempo.main!.humidity!) < 40 {
            escolha.append("Não se esqueça de beber bastante água! :)")
            escolha.append("Hidrate-se! O tempo está seco :)")

        }
        if (tempo.main?.temp_min)! < 15.0 {
            escolha.append("Não se esqueça de levar uma blusa, se for sair mais tarde! :)")
            escolha.append("Leve uma blusa, pode esfriar :)")

        }
        if (tempo.main?.temp_max)! > 30.0 {
            escolha.append("Não se esqueça de se hidratar nesse calor :)")
            escolha.append("Um sorvete cairia muito bem! :)")
        }
        
        if !escolha.isEmpty {return escolha.randomElement() ?? "Beba água :)"}
        
        switch tempo.weather?.first??.main {
        case "Thunderstorm":
            escolha.append("Evite deixar aparelhos elétricos ligados na tomada :)")
            escolha.append("Se proteja, e não fique em áreas abertas :)")
            break
        case "Drizzle":
            escolha.append("Não se esqueça do guarda-chuva! :)")
            escolha.append("Um chocolate quente cairia muito bem! :)")
            break
        case "Rain":
            escolha.append("Não se esqueça do guarda-chuva! :)")
            escolha.append("Um chocolate quente cairia muito bem! :)")
            break
        case "Snow":
            escolha.append("Não se esqueça de vestir seus casacos! :)")
            escolha.append("Cuidado pra não escorregar no gelo :)")
            break
        case "Mist":
            escolha.append("A visibilidade está baixa. Cuidado ao dirigir :)")
            escolha.append("Nevoeiro quando baixa, o sol racha :)")
            break
        case "Clear":
            escolha.append("Um ótimo dia para passear no parque :)")
            if Conversores.UnixParaDate(UNIX: (tempo.dt)!, diaMes: false) < "17:00"{
                escolha.append("Não esqueça de passar protetor solar :)")
            }
            else {
                escolha.append("Hoje dá pra ver as estrelas! :D")
            }
            break
        case "Clouds":
            escolha.append("O clima está ótimo para uma caminhada :)")
            break
        default:
            break
        }
       
        return escolha.randomElement() ?? "Beba água :)"
    }
    
    
}
