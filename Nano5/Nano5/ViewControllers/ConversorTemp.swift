//
//  ConversorTemp.swift
//  Nano5
//
//  Created by Caroline Viana on 23/02/21.
//

import Foundation

// Classe para conversão de temperaturas, uma vez que vamos implementar dois sistemas de temperaturas
// E a API do OpenWeather retorna as temperaturas em kelvin
class ConversorTemp {
    
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
    
}

