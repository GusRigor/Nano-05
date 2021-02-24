//
//  DetalhesViewController.swift
//  Nano5
//
//  Created by Caroline Viana on 24/02/21.
//

import UIKit

class DetalhesViewController: UIViewController {
    var temp = ""
    var ultimaQualAr: AirQuality?
    
    @IBOutlet weak var btnEscalaTemp: UIBarButtonItem!
    @IBOutlet weak var lblQualAr: UILabel!
    @IBOutlet weak var lblUmidade: UILabel!
    @IBOutlet weak var lblUv: UILabel!
    @IBOutlet weak var lblVento: UILabel!
    @IBOutlet weak var lblNasceSol: UILabel!
    @IBOutlet weak var lblPorSol: UILabel!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setTemperatura()
        WeatherForecastRequest.pesquisarTempo(-23.53, -46.62) { (tempo) in
            DispatchQueue.main.sync {
                self.lblUmidade.text = "Umidade: \(String(tempo.current?.humidity ?? 1234))%"
                self.lblUv.text = "Indice UV: \(String(tempo.current?.uvi ?? 1234))"
                self.lblVento.text = "Ventos: \(String(tempo.current?.wind_speed ?? 1234))m/s"
                self.atualizarSol(nasce: tempo.current?.sunrise ?? 0, poe: tempo.current?.sunset ?? 0)
                
            }
        }
        
        AirRequest.pesquisarQualidadeAr(-23.53, -46.62) { (Ar) in
            DispatchQueue.main.sync {
                self.ultimaQualAr = Ar
                self.lblQualAr.text = "Qualidade do ar: \(String(Ar.list?.first??.main?.aqi ?? 0))"
            }
        }
    }
    
    // MARK: setTemperatura
    func setTemperatura(){
        btnEscalaTemp.title = temp
    }
    
    // MARK: atualizarSol
    func atualizarSol(nasce: Int, poe: Int) {
        self.lblNasceSol.text = "Nascer do Sol: \(Conversores.UnixParaDate(UNIX: nasce, dataCompleta: false))"
        self.lblPorSol.text = "Pôr do Sol: \(Conversores.UnixParaDate(UNIX: poe, dataCompleta: false))"
    }
    
    // MARK: IBAction toggleTemp
    @IBAction func toggleTemp(_ sender: Any) {
//        if btnescalaTemp.title == "°C" {
//            btnescalaTemp.title = "°F"
//            tempAtual = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempAtual)
//            tempMin = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempMin)
//            tempMax = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempMax)
//            tempSen = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempSen)
//            AtualizarTemperaturas()
//        }
//        else {
//            btnescalaTemp.title = "°C"
//            tempAtual = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempAtual)
//            tempMin = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempMin)
//            tempMax = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempMax)
//            tempSen = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempSen)
//            AtualizarTemperaturas()
//        }
    }
    

    // MARK: prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetalheArViewController
        dest.qualAr = ultimaQualAr
    }
    

}
