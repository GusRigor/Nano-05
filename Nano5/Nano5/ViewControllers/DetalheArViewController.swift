//
//  DetalheArViewController.swift
//  Nano5
//
//  Created by Caroline Viana on 24/02/21.
//

import UIKit

class DetalheArViewController: UIViewController {
    
    var qualAr: AirQuality?
    
    // MARK: IBOutlets
    @IBOutlet weak var lblCO: UILabel!
    @IBOutlet weak var lblNO: UILabel!
    @IBOutlet weak var lblNO2: UILabel!
    @IBOutlet weak var lblO3: UILabel!
    @IBOutlet weak var lblSO2: UILabel!
    @IBOutlet weak var lblPM2_5: UILabel!
    @IBOutlet weak var lblPM10: UILabel!
    @IBOutlet weak var lblNH3: UILabel!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        lblCO.text = "CO: \(String(qualAr?.list?.first??.components?.co ?? 1234)) μg/m³"
        lblNO.text = "NO: \(String(qualAr?.list?.first??.components?.no ?? 1234)) μg/m³"
        lblNO2.text = "NO2: \(String(qualAr?.list?.first??.components?.no2 ?? 1234)) μg/m³"
        lblO3.text = "O3: \(String(qualAr?.list?.first??.components?.o3 ?? 1234)) μg/m³"
        lblSO2.text = "SO2: \(String(qualAr?.list?.first??.components?.so2 ?? 1234)) μg/m³"
        lblPM2_5.text = "PM2_5: \(String(qualAr?.list?.first??.components?.pm2_5 ?? 1234)) μg/m³"
        lblPM10.text = "PM10: \(String(qualAr?.list?.first??.components?.pm10 ?? 1234)) μg/m³"
        lblNH3.text = "NH3: \(String(qualAr?.list?.first??.components?.nh3 ?? 1234)) μg/m³"
    }
    
    // MARK: IBAction fechar
    @IBAction func fechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
