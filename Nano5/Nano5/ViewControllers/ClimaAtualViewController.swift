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
    
    let defalts = UserDefaults.standard

    //Variáveis para guardar as informações da tela anterior
    var geoAPI: Bool = true
    var mLocalizacao: Bool = true
    var lat: Float = -23.53
    var lon:Float = -46.62
    var nomeCidade: String = "São Paulo"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var cidadeCoreData: Cidade?
    
    var oneCall: WeatherForecast?
    
    var iconesD = [ 2: "11d:", 3: "09d", 6: "13d", 7: "50d", 50: "10d", 51: "13d", 52: "09d", 53: "09d", 800: "01d", 801: "02d", 802: "03d", 803: "04d", 804: "04d"]
    
    var iconesN = [ 2: "11n:", 3: "09n", 6: "13n", 7: "50n", 50: "10n", 51: "13n", 52: "09n", 53: "09n", 800: "01n", 801: "02n", 802: "03n", 803: "04n", 804: "04n"]
    
    /*
    Códigos:
     200 - 232 = 11d / 300 - 321 = 09d / 500 - 504 = 10d / 511 = 13d / 520 - 531 = 09d; / 600 - 622 = 13d / 701 - 781 = 50d / 800 = 01d / 801       = 02d / 802       = 03d / 803 - 804 = 04d
    */
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        if defalts.string(forKey: "escala") == nil {
            defalts.set("°C", forKey: "escala")
        }
        if btnescalaTemp.title != defalts.string(forKey: "escala") {
            btnescalaTemp.title = defalts.string(forKey: "escala")
        }
      
        if geoAPI{
//            WeatherGeoRequest.pesquisarTempo(lat, lon) { (tempo) in
//                DispatchQueue.main.sync {
//                    if self.defalts.string(forKey: "escala") == "°F" {
//                        self.tempAtual = Conversores.CelsiusParaFahrenheit(TempCelsius: tempo.main?.temp ?? 1234)
//                        self.tempSen = Conversores.CelsiusParaFahrenheit(TempCelsius: tempo.main?.feels_like ?? 1234)
//                        self.tempMin = Conversores.CelsiusParaFahrenheit(TempCelsius: tempo.main?.temp_min ?? 1234)
//                        self.tempMax = Conversores.CelsiusParaFahrenheit(TempCelsius: tempo.main?.temp_max ?? 1234)
//                    }
//                    else {
//                        self.tempAtual = tempo.main?.temp ?? 1234
//                        self.tempSen = tempo.main?.feels_like ?? 1234
//                        self.tempMin = tempo.main?.temp_min ?? 1234
//                        self.tempMax = tempo.main?.temp_max ?? 1234
//                    }
//                    self.lblDica.text = "Isso é uma dica muito útil pra esse tempo :)"
//                    self.title = tempo.name ?? "Erro :("
//                    self.AtualizarLabels()
//                    guard let desc = tempo.weather?.first??.description else { return }
//                    self.lblDescrição.text = desc
//
//                    self.AtualizarIcone(Cod: tempo.weather?.first??.id ?? 800, dt: tempo.dt!)
//
//                    self.lblDica.text = Dicas.gerarDica(tempo: tempo)
//
//                }
//            }
            if oneCall == nil{
                WeatherForecastRequest.pesquisarTempo(lat, lon) { (tempo) in
                    DispatchQueue.main.sync {
                        if self.defalts.string(forKey: "escala") == "°F" {
                            self.tempAtual = Conversores.kelvinParaFahrenheit(TempKelvin: tempo.current?.temp ?? 1234)
                            self.tempSen = Conversores.kelvinParaFahrenheit(TempKelvin: tempo.current?.feels_like ?? 1234)
                            self.tempMin = Conversores.kelvinParaFahrenheit(TempKelvin: tempo.daily?.first??.temp?.min ?? 1234)
                            self.tempMax = Conversores.kelvinParaFahrenheit(TempKelvin: tempo.daily?.first??.temp?.max ?? 1234)
                        }
                        else {
                            self.tempAtual = Conversores.kelvinParaCelsius(TempKelvin: tempo.current?.temp ?? 1234)
                            self.tempSen = Conversores.kelvinParaCelsius(TempKelvin: tempo.current?.feels_like ?? 1234)
                            self.tempMin = Conversores.kelvinParaCelsius(TempKelvin: tempo.daily?.first??.temp?.min ?? 1234)
                            self.tempMax = Conversores.kelvinParaCelsius(TempKelvin: tempo.daily?.first??.temp?.max ?? 1234)
                        }
                        self.lblDica.text = Dicas.gerarDica(tempo: tempo)
                        self.title = self.nomeCidade
                        self.AtualizarLabels()
                        guard let desc = tempo.current?.weather?.first??.description else { return }
                        self.lblDescrição.text = desc
                        
                        self.AtualizarIcone(Cod: tempo.current?.weather?.first??.id ?? 800, dt: (tempo.current?.dt)!)
                        self.oneCall = tempo
                        if !self.mLocalizacao{
                            self.title = self.cidadeCoreData!.nome ?? "Erro :("
                            
                            self.appDelegate.updateRecord(cidade: self.cidadeCoreData!, nome: self.cidadeCoreData!.nome ?? "Erro :(", lat: self.cidadeCoreData!.lat, lon: self.cidadeCoreData!.lon, temp: Conversores.kelvinParaCelsius(TempKelvin: tempo.current?.temp ?? 1234))
                        }
                    }

                    
//                    if(tempo.name != "Shuzenji"){
//                        self.appDelegate.updateRecord(cidade: self.cidadeCoreData!, nome: tempo.name ?? "Erro :(", lat: tempo.coord?.lat ?? 1, lon: tempo.coord?.lon ?? 2, temp: tempo.main?.temp  ?? 0.0)
//                    }

                }
            }
        }else{
            WeatherNameRequest.pesquisarTempo(nomeCidade) { (tempo) in
                DispatchQueue.main.sync {
                    self.tempAtual = Conversores.kelvinParaCelsius(TempKelvin: tempo.main?.temp  ?? 1234)
                    self.tempSen = Conversores.kelvinParaCelsius(TempKelvin: tempo.main?.feels_like ?? 1234)
                    self.tempMin = Conversores.kelvinParaCelsius(TempKelvin: tempo.main?.temp_min ?? 1234)
                    self.tempMax = Conversores.kelvinParaCelsius(TempKelvin: tempo.main?.temp_max ?? 1234)
                    self.lblDica.text = Dicas.gerarDica(tempo: tempo)
                    self.title = self.nomeCidade
                    self.AtualizarLabels()
            
                    guard let desc = tempo.weather?.first??.description else { return }
                    self.lblDescrição.text = desc
            
                    self.AtualizarIcone(Cod: tempo.weather?.first??.id ?? 800, dt: tempo.dt!)

                    self.appDelegate.updateRecord(cidade: self.cidadeCoreData!, nome: tempo.name ?? "Erro :(", lat: tempo.coord?.lat ?? 1, lon: tempo.coord?.lon ?? 2, temp: Conversores.kelvinParaCelsius(TempKelvin: tempo.main?.temp  ?? 273.0))
        
                }
            }
            
        }
        
        print("\(lat) | \(lon) | \(nomeCidade)")
        

        
    }
    
    // MARK: atualizarTemperaturas
    // Converte as temperaturas entre Celsius e Fahrenheit
    func atualizarTemperaturas(){
        if btnescalaTemp.title == "°C" {
            tempAtual = Conversores.CelsiusParaFahrenheit(TempCelsius: tempAtual)
            tempMin = Conversores.CelsiusParaFahrenheit(TempCelsius: tempMin)
            tempMax = Conversores.CelsiusParaFahrenheit(TempCelsius: tempMax)
            tempSen = Conversores.CelsiusParaFahrenheit(TempCelsius: tempSen)
            AtualizarLabels()
        }
        else {
            tempAtual = Conversores.FahrenheitParaCelsius(TempFahr: tempAtual)
            tempMin = Conversores.FahrenheitParaCelsius(TempFahr: tempMin)
            tempMax = Conversores.FahrenheitParaCelsius(TempFahr: tempMax)
            tempSen = Conversores.FahrenheitParaCelsius(TempFahr: tempSen)
            AtualizarLabels()
        }
    }
    
    
    // MARK: AtualizarTemperaturas
    // Função para atualizar a temperatura das labels
    func AtualizarLabels(){
        self.lblTempAtual.text = "\(Int(tempAtual))°"
        self.lblSensacao.text = "Sensação: \(Int(tempSen))°"
        self.lblTempMin.text = "Mín: \(Int(tempMin))°"
        self.lblTempMax.text = "Max: \(Int(tempMax))°"
    }
    
    // MARK: AtualizarIcone
    // Função que atualiza o ícone mostrado na tela, fazendo o calculo do ID pra encontrar no dicionário o valor
    func AtualizarIcone(Cod: Int, dt: Int){
        var codCent: Int = Cod / 100
        if codCent == 5 {
            codCent = Cod / 10
        }
        else if codCent == 8 {
            codCent = Cod
        }
        
        let horaDate = Conversores.UnixParaDate(UNIX: dt, diaMes: false)
        if horaDate > "18:00" {
            imgClima.image = UIImage(named: iconesN[codCent] ?? "01n")
        }
        else {
            imgClima.image = UIImage(named: iconesD[codCent] ?? "01d")
        }
        
    }
    
    // MARK: IBAction toggleTemp
    // Função de mudança de temperatura entre °C e °F, a partir do clique no item da navigationBar
    @IBAction func toggleTemp(_ sender: Any) {
        if btnescalaTemp.title == "°C" {
            defalts.set("°F", forKey: "escala")
        }
        else {
            defalts.set("°C", forKey: "escala")
        }
        atualizarTemperaturas()
        btnescalaTemp.title = defalts.string(forKey: "escala")
    }
    
    // MARK: prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetalhesViewController
        dest.temp = btnescalaTemp.title!
        dest.ultimaForecast = oneCall
        dest.lat = lat
        dest.lon = lon
    }
    

}
