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
    @IBOutlet weak var lblDicaAr: UILabel!
    @IBOutlet weak var lblQualidade: UILabel!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        lblCO.text = "CO: \(String(qualAr?.list?.first??.components?.co ?? 1234)) μg/m³"
        lblNO.text = "NO: \(String(qualAr?.list?.first??.components?.no ?? 1234)) μg/m³"
        lblNO2.text = "NO₂: \(String(qualAr?.list?.first??.components?.no2 ?? 1234)) μg/m³"
        lblO3.text = "O₃: \(String(qualAr?.list?.first??.components?.o3 ?? 1234)) μg/m³"
        lblSO2.text = "SO₂: \(String(qualAr?.list?.first??.components?.so2 ?? 1234)) μg/m³"
        lblPM2_5.text = "PM₂₅: \(String(qualAr?.list?.first??.components?.pm2_5 ?? 1234)) μg/m³"
        lblPM10.text = "PM₁₀: \(String(qualAr?.list?.first??.components?.pm10 ?? 1234)) μg/m³"
        lblNH3.text = "NH₃: \(String(qualAr?.list?.first??.components?.nh3 ?? 1234)) μg/m³"
        
        switch qualAr?.list?.first??.main?.aqi {
        case 1:
            lblQualidade.text = "Qualidade do ar: Ótima"
            lblDicaAr.text = "Tudo certo :)"
            break
        case 2:
            lblQualidade.text = "Qualidade do ar: Boa"
            lblDicaAr.text = "Tudo certo :)"
            break
        case 3:
            lblQualidade.text = "Qualidade do ar: Moderada"
            lblDicaAr.text = "Se você tem problemas respiratórios, pode ter alguns sintomas mais leves, como tosse seca."
            break
        case 4:
            lblQualidade.text = "Qualidade do ar: Ruim"
            lblDicaAr.text = "Você pode ter tosse seca e ardor nos olhos, nariz e garganta."
            break
        case 5:
            lblQualidade.text = "Qualidade do ar: Muito ruim"
            lblDicaAr.text = "Você pode ter sintomas de problemas respiratórios."
            break
        default:
            print("foi pro default e deu errado")
            break
        }
        print(view.frame.size.height)
        if view.frame.size.height < 630 {
            
        }
        
        
    }
    
    // MARK: IBAction fechar
    @IBAction func fechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
