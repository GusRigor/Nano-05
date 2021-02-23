//
//  ClimaAtualViewController.swift
//  Nano5
//
//  Created by Caroline Viana on 23/02/21.
//

import UIKit

class ClimaAtualViewController: UIViewController {
    
    // MARK: IBOutlets
    // Outlets do Storyboard
    @IBOutlet weak var btnescalaTemp: UIBarButtonItem!
    @IBOutlet weak var lblTempAtual: UILabel!
    @IBOutlet weak var lblSensacao: UILabel!
    @IBOutlet weak var lblTempMin: UILabel!
    @IBOutlet weak var lblTempMax: UILabel!
    @IBOutlet weak var lblDica: UILabel!
    @IBOutlet weak var lblDescrição: UILabel!
    @IBOutlet weak var imgClima: UIImageView!
    
    // Variáveis para guardar a temperatura, podem ser necessárias fora das labels
    var tempAtual: Float = 0
    var tempSen: Float = 0
    var tempMin: Float = 0
    var tempMax: Float = 0
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Como a requisição tá sendo feita pela API do FCC e ela vem com Celsius como padrão
        btnescalaTemp.title = "°C"
        WeatherGeoRequest.pesquisarTempo(-23.53, -46.62) { (tempo) in
            DispatchQueue.main.sync {
                self.tempAtual = tempo.main?.temp ?? 1234
                self.tempSen = tempo.main?.feels_like ?? 1234
                self.tempMin = tempo.main?.temp_min ?? 1234
                self.tempMax = tempo.main?.temp_max ?? 1234
                self.lblDica.text = "Isso é uma dica muito útil pra esse tempo"
                self.lblDescrição.text = "\(String(tempo.weather?.description ?? "Erro :("))"
                self.title = tempo.name ?? "Erro :("
                self.AtualizarTemperaturas()
            }
        }
        
    }
    
    // MARK: AtualizarTemperaturas
    // Função para atualizar a temperatura das labels
    func AtualizarTemperaturas(){
        self.lblTempAtual.text = "\(Int(tempAtual))°"
        self.lblSensacao.text = "Sensação: \(Int(tempSen))°"
        self.lblTempMin.text = "Mín: \(Int(tempMin))°"
        self.lblTempMax.text = "Max: \(Int(tempMax))°"
    }
    
    // MARK: IBAction toggleTemp
    // Função de mudança de temperatura entre °C e °F, a partir do clique no item da navigationBar
    @IBAction func toggleTemp(_ sender: Any) {
        if btnescalaTemp.title == "°C" {
            btnescalaTemp.title = "°F"
            tempAtual = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempAtual)
            tempMin = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempMin)
            tempMax = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempMax)
            tempSen = ConversorTemp.CelsiusParaFahrenheit(TempCelsius: tempSen)
            AtualizarTemperaturas()
        }
        else {
            btnescalaTemp.title = "°C"
            tempAtual = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempAtual)
            tempMin = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempMin)
            tempMax = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempMax)
            tempSen = ConversorTemp.FahrenheitParaCelsius(TempFahr: tempSen)
            AtualizarTemperaturas()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
