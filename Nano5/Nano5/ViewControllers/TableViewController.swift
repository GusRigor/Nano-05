//
//  TableViewController.swift
//  Nano5
//
//  Created by Rafael Costa on 23/02/21.
//

import Foundation
import UIKit

class TableViewController: UITableViewController{
    @IBOutlet var CidadesTable: UITableView!
    var cidades = ["Sao Paulo","Osasco","Diadema","Dubai","Londres"]
    var temperaturas = [22,22,24,30,12]
    override func viewDidLoad() {
        super.viewDidLoad()
        CidadesTable.delegate = self
        CidadesTable.dataSource = self
    }
}

extension TableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("vc clicou em \(cidades[indexPath.row])")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cidades.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CidadesTable.dequeueReusableCell(withIdentifier: "CidadesCelula") as! CidadeTableViewCell
        let cidade = cidades[indexPath.row]
        let temperatura = temperaturas[indexPath.row]
        cell.NomeCidade.text = cidade
        cell.TemperaturaCidade.text = String(temperatura)
        
        return cell
    }
}
