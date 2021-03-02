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
    
    
    @IBOutlet weak var lblInfoCO: UILabel!
    @IBOutlet weak var lblInfoNO: UILabel!
    @IBOutlet weak var lblInfoNO2: UILabel!
    @IBOutlet weak var lblInfoO3: UILabel!
    @IBOutlet weak var lblInfoSO2: UILabel!
    @IBOutlet weak var lblInfoPM2_5: UILabel!
    @IBOutlet weak var lblInfoPM10: UILabel!
    @IBOutlet weak var lblInfoNH3: UILabel!
    
    
    
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
        setAcessibilidade()
        
        
        
    }
    
    
    func setAcessibilidade(){
        lblQualidade.accessibilityLabel = lblQualidade.text
        lblDicaAr.accessibilityLabel = lblDicaAr.text
        lblCO.accessibilityLabel = "Monóxido de carbono: \(String(qualAr?.list?.first??.components?.co ?? 1234)) microgramas por metro cúbico."
        lblInfoCO.accessibilityLabel = "A quantidade ideal de monóxido de carbono é abaixo de 230 microgramas por metro cúbico."
        lblNO.accessibilityLabel = "monóxido de nitrogênio: \(String(qualAr?.list?.first??.components?.no ?? 1234)) microgramas por metro cúbico."
        lblInfoNO.accessibilityLabel = "A quantidade ideal de monóxido de nitrogênio é abaixo de 30 microgramas por metro cúbico."
        lblNO2.accessibilityLabel = "dióxido de nitrogênio: \(String(qualAr?.list?.first??.components?.no2 ?? 1234)) microgramas por metro cúbico."
        lblInfoNO2.accessibilityLabel = "A quantidade ideal de dióxido de nitrogênio é abaixo de 240 microgramas por metro cúbico."
        lblO3.accessibilityLabel = "ozônio: \(String(qualAr?.list?.first??.components?.o3 ?? 1234)) microgramas por metro cúbico."
        lblInfoO3.accessibilityLabel = "A quantidade ideal de ozônio é abaixo de 100 microgramas por metro cúbico."
        lblSO2.accessibilityLabel = "dióxido de enxofre: \(String(qualAr?.list?.first??.components?.so2 ?? 1234)) microgramas por metro cúbico"
        lblInfoSO2.accessibilityLabel = "A quantidade ideal de dióxido de enxofre é abaixo de 30 microgramas por metro cúbico."
        lblPM2_5.accessibilityLabel = "partículas inaláveis finas: \(String(qualAr?.list?.first??.components?.pm2_5 ?? 1234)) microgramas por metro cúbico"
        lblInfoPM2_5.accessibilityLabel = "A quantidade ideal de partículas inaláveis finas é abaixo de 40 microgramas por metro cúbico."
        lblPM10.accessibilityLabel = "partículas inaláveis: \(String(qualAr?.list?.first??.components?.pm10 ?? 1234)) microgramas por metro cúbico"
        lblInfoPM10.accessibilityLabel = "A quantidade ideal de partículas inaláveis é abaixo de 100 microgramas por metro cúbico."
        lblNH3.accessibilityLabel = "amônia: \(String(qualAr?.list?.first??.components?.nh3 ?? 1234)) microgramas por metro cúbico"
        lblInfoNH3.accessibilityLabel = "A quantidade ideal de amônia é abaixo de 18 microgramas por metro cúbico."
    }
    
    
    // MARK: IBAction fechar
    @IBAction func fechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
