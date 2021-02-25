//
//  DetalhesViewController.swift
//  Nano5
//
//  Created by Caroline Viana on 24/02/21.
//

import UIKit

class DetalhesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]
    
    
    var temp = ""
    var ultimaQualAr: AirQuality?
    var ultimaForecast: WeatherForecast?
    
    
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

    }

    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        WeatherForecastRequest.pesquisarTempo(-23.53, -46.62) { (tempo) in
            DispatchQueue.main.sync {
                self.ultimaForecast = tempo
                self.lblUmidade.text = "Umidade: \(String(tempo.current?.humidity ?? 1234))%"
                self.lblUv.text = "Indice UV: \(String(tempo.current?.uvi ?? 1234))"
                self.lblVento.text = "Ventos: \(String(tempo.current?.wind_speed ?? 1234))m/s"
                self.atualizarSol(nasce: tempo.current?.sunrise ?? 0, poe: tempo.current?.sunset ?? 0)
                
            }
        }
        
        setTemperatura()
        
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
    
    // MARK: - Relacionadas CollectionView
    
    // Quantidade de celulas, UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // Uma célula pra cada index
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.date.text = self.items[indexPath.row]
        cell.backgroundColor = UIColor.lightGray
        collectionView.isScrollEnabled = false
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate protocol
    // Quando seleciona alguma coisa
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    // MARK: - End
    
    
    
    // MARK: IBAction toggleTemp
    @IBAction func toggleTemp(_ sender: Any) {
        if btnEscalaTemp.title == "°C" {
            btnEscalaTemp.title = "°F"

        }
        else {
            btnEscalaTemp.title = "°C"
            
        }
    }
    

    // MARK: prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetalheArViewController
        dest.qualAr = ultimaQualAr
    }
    

}
