//
//  DetalhesViewController.swift
//  Nano5
//
//  Created by Caroline Viana on 24/02/21.
//

import UIKit

class DetalhesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
   //MARK: Variáveis e constantes
    var temp = ""
    var lat: Float = -23.53
    var lon: Float = -46.62
    
    var ultimaQualAr: AirQuality?
    var ultimaForecast: WeatherForecast?
    var iconesD = [ 2: "11d:", 3: "09d", 6: "13d", 7: "50d", 50: "10d", 51: "13d", 52: "09d", 53: "09d", 800: "01d", 801: "02d", 802: "03d", 803: "04d", 804: "04d"]
    let reuseIdentifier = "cell"
    let defalts = UserDefaults.standard
    
    // MARK: IBOutlets
    @IBOutlet weak var btnEscalaTemp: UIBarButtonItem!
    @IBOutlet weak var lblQualAr: UILabel!
    @IBOutlet weak var lblUmidade: UILabel!
    @IBOutlet weak var lblUv: UILabel!
    @IBOutlet weak var lblVento: UILabel!
    @IBOutlet weak var lblNasceSol: UILabel!
    @IBOutlet weak var lblPorSol: UILabel!
    @IBOutlet weak var collectPrevisao: UICollectionView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        if ultimaForecast == nil {
            WeatherForecastRequest.pesquisarTempo(lat, lon) { (tempo) in
                DispatchQueue.main.sync {
                    self.ultimaForecast = tempo
                    self.lblUmidade.text = "Umidade: \(String(tempo.current?.humidity ?? 1234))%"
                    self.lblUv.text = "Indice UV: \(String(tempo.current?.uvi ?? 1234))"
                    self.lblVento.text = "Ventos: \(String(tempo.current?.wind_speed ?? 1234))m/s"
                    self.atualizarSol(nasce: tempo.current?.sunrise ?? 0, poe: tempo.current?.sunset ?? 0)
                    self.collectPrevisao.reloadData()

                }
            }
        }
        else {
            self.lblUmidade.text = "Umidade: \(String(ultimaForecast?.current?.humidity ?? 1234))%"
            self.lblUv.text = "Indice UV: \(String(ultimaForecast?.current?.uvi ?? 1234))"
            self.lblVento.text = "Ventos: \(String(ultimaForecast?.current?.wind_speed ?? 1234))m/s"
            self.atualizarSol(nasce: ultimaForecast?.current?.sunrise ?? 0, poe: ultimaForecast?.current?.sunset ?? 0)
            self.collectPrevisao.reloadData()
        }

        setTemperatura()

        AirRequest.pesquisarQualidadeAr(lat, lon) { (Ar) in
            DispatchQueue.main.sync {
                self.ultimaQualAr = Ar
                self.lblQualAr.text = "Qualidade do ar: \(self.qualidadeAr(indice: Ar.list?.first??.main?.aqi ?? 0))"
            }
        }
        
    }
    
    // MARK: setTemperatura
    // Atualiza as temperaturas dentro da collectionView e no UD
    func setTemperatura(){
        btnEscalaTemp.title = defalts.string(forKey: "escala")
        collectPrevisao.reloadData()
    }
    
    // MARK: atualizarSol
    // Converte e atualiza as labels relacionadas ao nascer e por do sol
    func atualizarSol(nasce: Int, poe: Int) {
        self.lblNasceSol.text = "Nascer do Sol: \(Conversores.UnixParaDate(UNIX: nasce, diaMes: false))"
        self.lblPorSol.text = "Pôr do Sol: \(Conversores.UnixParaDate(UNIX: poe, diaMes: false))"
    }
    
    // MARK: AtualizarIcone
    // Função que atualiza o ícone mostrado em cada celula, fazendo o calculo do ID pra encontrar no dicionário o valor
    func AtualizarIcone(Cod: Int, img: UIImageView){
        var codCent: Int = Cod / 100
        if codCent == 5 {
            codCent = Cod / 10
        }
        else if codCent == 8 {
            codCent = Cod
        }
        img.image = UIImage(named: iconesD[codCent] ?? "01d")
    }
    
    // MARK: qualidadeAr
    // Função simples pra retornar uma frase sobre a qualidade do ar
    func qualidadeAr(indice: Int) -> String {
        switch indice {
        case 1:
            return "Ótima"
        case 2:
            return "Boa"
        case 3:
            return "Moderada"
        case 4:
            return "Ruim"
        case 5:
            return "Muito ruim"
        default:
            print("foi pro default e deu errado")
            return ":("
        }
    }
    
    // MARK: - Relacionadas CollectionView
    
    // Quantidade de celulas, UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ultimaForecast?.daily?.count ?? 3
    }
    
    // Uma célula pra cada index
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        if ultimaForecast != nil {
            let configData = ultimaForecast!.daily![indexPath.row]!.dt
            cell.date.text = Conversores.UnixParaDate(UNIX: configData!, diaMes: true)
            
            let escalaTemp = defalts.string(forKey: "escala")
            var tempMin = ultimaForecast?.daily?[indexPath.row]?.temp?.min ?? 1234
            var tempMax = ultimaForecast?.daily?[indexPath.row]?.temp?.max ?? 1234
            if escalaTemp == "°C" {
                tempMin = floor(Conversores.kelvinParaCelsius(TempKelvin: tempMin))
                tempMax = floor(Conversores.kelvinParaCelsius(TempKelvin: tempMax))
            }
            else {
                tempMin = floor(Conversores.kelvinParaFahrenheit(TempKelvin: tempMin))
                tempMax = floor(Conversores.kelvinParaFahrenheit(TempKelvin: tempMax))
            }
            cell.lblMin.text = "Min: \(String(tempMin))°"
            cell.lblMax.text = "Max: \(String(tempMax))°"
            AtualizarIcone(Cod: ultimaForecast?.daily?[indexPath.row]?.weather?.first??.id ?? 800, img: cell.imgIcon)
        }
        
        cell.layer.borderWidth = 2
        collectionView.isScrollEnabled = false
        
        return cell
    }
    
    // Quando seleciona alguma coisa
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    // MARK: - End
    
    
    
    // MARK: IBAction toggleTemp
    // Mudar a temperatura
    @IBAction func toggleTemp(_ sender: Any) {
        if btnEscalaTemp.title == "°C" {
            defalts.set("°F", forKey: "escala")
            setTemperatura()
        }
        else {
            defalts.set("°C", forKey: "escala")
            setTemperatura()
            
        }
    }

    // MARK: prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetalheArViewController
        dest.qualAr = ultimaQualAr
    }
}
