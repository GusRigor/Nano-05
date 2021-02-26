//
//  ConversorTemp.swift
//  Nano5
//
//  Created by Caroline Viana on 23/02/21.
//

import Foundation

// Classe para conversão de temperaturas, uma vez que vamos implementar dois sistemas de temperaturas
// E a API do OpenWeather retorna as temperaturas em kelvin
class Conversores {
    
    class func kelvinParaCelsius(TempKelvin: Float) -> Float {
        return (TempKelvin - 273)
    }
    
    class func kelvinParaFahrenheit(TempKelvin: Float) -> Float {
        return ((((TempKelvin - 273) / 5) * 9) + 32)
    }
    
    class func CelsiusParaFahrenheit(TempCelsius: Float) -> Float {
        return (1.8 * TempCelsius + 32)
    }
    
    class func FahrenheitParaCelsius(TempFahr: Float) -> Float {
        return ((TempFahr - 32) / 1.8)
    }
    
    class func UnixParaDate(UNIX: Int, diaMes: Bool) -> String {
        let date = Date(timeIntervalSince1970: Double(UNIX))
        // Negócio pra formatar a data, pois estava no formato GMT-00:00 e não estamos nessa timezone
        let formatador = DateFormatter()
        formatador.timeZone = TimeZone(abbreviation: "GMT-03:00") // timezone do Brasil
        formatador.locale = NSLocale.current
        if diaMes {
            formatador.dateFormat = "dd-MM"
        }
        else {
            formatador.dateFormat = "HH:mm" // formato do horário
        }
        let horaDate = formatador.string(from: date)
        return horaDate

    }
    
}

