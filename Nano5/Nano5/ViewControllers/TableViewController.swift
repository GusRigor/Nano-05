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
    @IBOutlet weak var PesquisarCidade: UISearchBar!
    
    var cidades = ["Sao Paulo","Osasco","Diadema","Dubai","Londres"]
    var temperaturas = [22,22,24,30,12]
    var filtro: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CidadesTable.delegate = self
        CidadesTable.dataSource = self
        PesquisarCidade.delegate = self
        filtro = cidades
    }
}

extension TableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("vc clicou em \(filtro[indexPath.row])")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtro.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CidadesTable.dequeueReusableCell(withIdentifier: "CidadesCelula") as! CidadeTableViewCell
        let cidade = filtro[indexPath.row]
        let temperatura = temperaturas[indexPath.row]
        cell.NomeCidade.text = cidade
        cell.TemperaturaCidade.text = String(temperatura)
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        filtro = []
        
        if searchText == "" {
            filtro = cidades
        }else{
            for cidade in cidades{
                if cidade.lowercased().contains(searchText.lowercased()){
                    filtro.append(cidade)
                }
            }
        }
        self.CidadesTable.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("You're")
//        cidades.append(searchBar.searchTextField.text!)
//        temperaturas.append(20)
    }
}
