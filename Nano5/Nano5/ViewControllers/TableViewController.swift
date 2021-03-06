//
//  TableViewController.swift
//  Nano5
//
//  Created by Rafael Costa on 23/02/21.
//

import Foundation
import UIKit
import CoreLocation

class TableViewController: UITableViewController, UISearchBarDelegate, CLLocationManagerDelegate{
    var lat: Float = 0.0
    var lon: Float = 0.0
    var tLat: Float = 0.0
    var tLon : Float = 0.0
    var geoAPI: Bool = true
    var mLocalizacao: Bool = false
    var nomeCidade: String = ""
    var permissao: Int = 0
    var manager: CLLocationManager?
    
    var tempMiLocalizacao: Float = 0.0
    var timer1: Timer!
    var timer2: Timer!
    
    @IBOutlet var CidadesTable: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var city = Cidades().recebe()
    var cidadesCoreData = [Cidade]()
    var cidadeTelaSeguinte: Cidade?
    @IBOutlet weak var PesquisarCidade: UISearchBar!
    var filtro: [Cidade]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CidadesTable.delegate = self
        CidadesTable.dataSource = self
        PesquisarCidade.delegate = self
        filtro = cidadesCoreData
        
        timer1 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(BuscaTemp), userInfo: nil, repeats: false)
        timer2 = Timer.scheduledTimer(timeInterval: 300.0, target: self, selector: #selector(BuscaTemp), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cidadesCoreData = appDelegate.fetchRecords()
        filtro = cidadesCoreData
        CidadesTable.reloadData()
        
        
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
        
    }
    
    @objc func BuscaTemp(){
        if permissao == 1{
            print("\(self.lat) | \(self.lon)")
            WeatherGeoRequest.pesquisarTempo(self.lat, self.lon) { (tempo) in
                DispatchQueue.main.sync {
                    self.tempMiLocalizacao = Float(tempo.main?.temp ?? 0)
                    print(tempo.main?.temp ?? 0)
                    print(tempo.sys?.country as Any)
                    self.CidadesTable.reloadData()
                    print(0)
                }
            }
        }
        for chave in filtro {
            print("\(chave.lat) | \(chave.lon)")
            WeatherGeoRequest.pesquisarTempo(chave.lat, chave.lon) { (tempo) in
                DispatchQueue.main.sync {
                    let temp = Float(tempo.main?.temp ?? 0.0)
                    print(tempo.main?.temp ?? 0.0)
                    print(tempo.sys?.country as Any)
                    self.appDelegate.updateRecord(cidade: chave, nome: chave.nome ?? "A", lat: chave.lat, lon: chave.lon, temp: temp)
                    self.CidadesTable.reloadData()
                    print(chave)
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
            
        }
        lat = Float(first.coordinate.latitude)
        lon = Float(first.coordinate.longitude)
        //print("\(lat) | \(lon)")
        permissao = 1
        CidadesTable.reloadData()
        
    }

    
}

extension TableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if permissao == 1{
            if indexPath.row == 0{
                print("vc clicou em minha localizacao")
                tLat = lat; tLon = lon; geoAPI = true
                PesquisarCidade.endEditing(true)
                nomeCidade = "Minha Localização"
                mLocalizacao = true
                performSegue(withIdentifier: "segueCidade", sender: self)
            }else{
                print("vc clicou em \(filtro[indexPath.row - 1].nome!)")
                tLat = filtro[indexPath.row-1].lat; tLon = filtro[indexPath.row-1].lon; geoAPI = true
                cidadeTelaSeguinte = filtro[indexPath.row-1]
                PesquisarCidade.endEditing(true)
                nomeCidade = filtro[indexPath.row-1].nome!
                performSegue(withIdentifier: "segueCidade", sender: self)
            }
        }else{
            print("vc clicou em \(filtro[indexPath.row].nome!)")
            tLat = filtro[indexPath.row].lat; tLon = filtro[indexPath.row].lon; geoAPI = true
            cidadeTelaSeguinte = filtro[indexPath.row]
            PesquisarCidade.endEditing(true)
            nomeCidade = filtro[indexPath.row].nome!
            performSegue(withIdentifier: "segueCidade", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if permissao == 1{
            return (filtro.count + 1)
        }else{
            return filtro.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CidadesTable.dequeueReusableCell(withIdentifier: "CidadesCelula") as! CidadeTableViewCell
        
        if permissao == 1{
            if indexPath.row == 0{
                cell.NomeCidade.text = "Minha Localização"
                cell.TemperaturaCidade.text = String(format: "%.0f",tempMiLocalizacao) + "ºC"
                cell.isAccessibilityElement = true
                cell.accessibilityLabel = "Minha localização, \(String(format: "%.0f",tempMiLocalizacao)) graus celsius"
                cell.accessibilityHint = "Aperte duas vezes para mais informações sobre o tempo nesse local"
            }else{
                let cidade = filtro[indexPath.row - 1].nome
                cell.NomeCidade.text = cidade
                cell.TemperaturaCidade.text = String(format: "%.0f",filtro[indexPath.row - 1].temp ) + "ºC"
                cell.isAccessibilityElement = true
                cell.accessibilityLabel = "\(cidade ?? "A"), \(String(format: "%.0f",filtro[indexPath.row - 1].temp)) graus celsius"
                cell.accessibilityHint = "Aperte duas vezes para mais informações sobre o tempo nesse local"
            }
        }else{
            let cidade = filtro[indexPath.row].nome
            cell.NomeCidade.text = cidade
            cell.TemperaturaCidade.text = String(format: "%.0f",filtro[indexPath.row].temp ) + "ºC"
            cell.isAccessibilityElement = true
            cell.accessibilityLabel = "\(cidade ?? "A"), \(String(format: "%.0f",filtro[indexPath.row].temp)) graus celsius"
            cell.accessibilityHint = "Aperte duas vezes para mais informações sobre o tempo nesse local"
        }
   
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (permissao == 1 && indexPath.row != 0){
            if editingStyle == .delete{
                let cidade = filtro[indexPath.row - 1]
                appDelegate.deleteRecord(cidade: cidade)
                cidadesCoreData = appDelegate.fetchRecords()
                filtro = cidadesCoreData
                CidadesTable.reloadData()
            }
        }else if permissao == 0{
            if editingStyle == .delete{
                let cidade = filtro[indexPath.row]
                appDelegate.deleteRecord(cidade: cidade)
                cidadesCoreData = appDelegate.fetchRecords()
                filtro = cidadesCoreData
                CidadesTable.reloadData()
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        filtro = []
        
        if searchText == "" {
            filtro = cidadesCoreData
        }else{
            for cidade in cidadesCoreData{
                if cidade.nome!.lowercased().contains(searchText.lowercased()){
                    filtro.append(cidade)
                }
            }
        }
        self.CidadesTable.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var nAchou = true
        var naLista:Bool = false
        var lat: Float = 0.0
        var lon : Float = 0.0
        
        for city in cidadesCoreData{
            if city.nome!.lowercased() == searchBar.searchTextField.text!.lowercased() {
                lat = city.lat ; lon = city.lon
                nomeCidade = city.nome!
                naLista = true
                cidadeTelaSeguinte = city
            }
        }
        if !naLista {
            //Verifica se a cidade procurada está entre as cidades salvas
            for cidade in Cidades().cities["cidades"]!{
                if searchBar.searchTextField.text!.lowercased() == cidade["nome"] as! String {
                    lat = cidade["lat"] as! Float; lon = cidade["lon"] as! Float
                    self.appDelegate.insertRecord(nome: searchBar.searchTextField.text!, lat: lat, lon: lon, time: Date())
                    nomeCidade = cidade["nome"] as! String
                    nAchou = false; geoAPI = true
                    print("Achou")
                }
            }
            
            if nAchou {
                self.appDelegate.insertRecord(nome: searchBar.searchTextField.text!, lat: 1, lon: 2, time: Date())
                geoAPI = false
                nomeCidade = searchBar.searchTextField.text!
            }
            
            if permissao == 1{
                if cidadesCoreData.count == 0 {
                    cidadesCoreData = appDelegate.fetchRecords()
                    cidadeTelaSeguinte = cidadesCoreData[0]
                }else{
                    cidadeTelaSeguinte = cidadesCoreData[cidadesCoreData.count-1]
                }
                
            }else{
                
                cidadeTelaSeguinte = cidadesCoreData[cidadesCoreData.count]
            }
        }
        //print("You're the breathtaking")
        
        cidadesCoreData = appDelegate.fetchRecords()
        CidadesTable.reloadData()
        tLat = lat; tLon = lon
        
        PesquisarCidade.endEditing(true)
        PesquisarCidade.text = ""
        
        performSegue(withIdentifier: "segueCidade", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ClimaAtualViewController
        dest.tempMinhaLocalizacao = self
        dest.lat = tLat
        dest.lon = tLon
        dest.geoAPI = geoAPI
        dest.nomeCidade = nomeCidade
        dest.cidadeCoreData = cidadeTelaSeguinte
        dest.mLocalizacao = mLocalizacao
        mLocalizacao = false
    }
}

extension TableViewController: TempMinhaLocalizacao{
    func Atualizar(temp: Float) {
        tempMiLocalizacao = temp
    }
    
    
}
