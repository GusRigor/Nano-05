//
//  TableViewController.swift
//  Nano5
//
//  Created by Rafael Costa on 23/02/21.
//

import Foundation
import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate{
    @IBOutlet var CidadesTable: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var city = Cidades().recebe()
    var cidadesCoreData = [Cidade]()
    @IBOutlet weak var PesquisarCidade: UISearchBar!
    
    var cidades = ["Sao Paulo","Osasco","Diadema","Dubai","Londres"]
    var temperaturas = [22,22,24,30,12]
    var filtro: [Cidade]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CidadesTable.delegate = self
        CidadesTable.dataSource = self
        PesquisarCidade.delegate = self
        filtro = cidadesCoreData
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cidadesCoreData = appDelegate.fetchRecords()
        filtro = cidadesCoreData
        CidadesTable.reloadData()
        
    }
}

extension TableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("vc clicou em \(cidadesCoreData[indexPath.row].nome!)")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ClimaAtualViewController") as! ClimaAtualViewController
        navigationController?.pushViewController(vc, animated: true)

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtro.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CidadesTable.dequeueReusableCell(withIdentifier: "CidadesCelula") as! CidadeTableViewCell
        let cidade = filtro[indexPath.row].nome
        cell.NomeCidade.text = cidade
        
//        let temperatura = temperaturas[indexPath.row]
//        cell.TemperaturaCidade.text = String(temperatura)

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let cidade = filtro[indexPath.row]
            appDelegate.deleteRecord(cidade: cidade)
            cidadesCoreData = appDelegate.fetchRecords()
            filtro = cidadesCoreData
            CidadesTable.reloadData()
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
        for cidade in Cidades().cities["cidades"]!{
            if searchBar.searchTextField.text!.lowercased() == cidade["nome"] as! String {
                self.appDelegate.insertRecord(nome: searchBar.searchTextField.text!, lat: cidade["lat"] as! Float, lon: cidade["lon"] as! Float, time: Date())
                nAchou = false
            }
        }
        if nAchou {
            self.appDelegate.insertRecord(nome: searchBar.searchTextField.text!, lat: 1, lon: 2, time: Date())
        }
        print("You're the breathtaking")
        cidadesCoreData = appDelegate.fetchRecords()
        CidadesTable.reloadData()
    }
}
