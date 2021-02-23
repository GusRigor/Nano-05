//
//  ViewController.swift
//  GPS
//
//  Created by Rafael Costa on 07/02/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var lat: Float = 0.0
    var lon: Float = 0.0
    
    @IBOutlet weak var CO: UILabel!
    @IBOutlet weak var NO: UILabel!
    @IBOutlet weak var NO2: UILabel!
    @IBOutlet weak var O3: UILabel!
    @IBOutlet weak var SO2: UILabel!
    @IBOutlet weak var PM2: UILabel!
    @IBOutlet weak var PM10: UILabel!
    @IBOutlet weak var NH3: UILabel!
    
    @IBOutlet weak var Label: UILabel!
    var manager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        
        lat = Float(first.coordinate.latitude)
        lon = Float(first.coordinate.longitude)
        
        let a = String(format: "%.4f", first.coordinate.latitude)
        let b = String(format: "%.4f", first.coordinate.longitude)
        Label.text = "\(a) | \(b)"
    }
    
    @IBAction func Pesquisar(_ sender: Any) {
        PollutionAPI.pesquisarQualidadeAr(lat,lon) { (air) in
            DispatchQueue.main.sync {
//                print(air.coord.lat)
                print(air.lon!)
                self.CO.text = "\(air.current?.temp ?? 0)"
//                print(air.list.first!.main.aqi)
//                print(air.list.first!.components.co)
//                print(air.list.first!.dt)
//                self.Label.text = "\(air.list.first!.main.aqi)"
//                self.CO.text = "C0: \(air.list.first!.components.co)"
//                self.NO.text = "C0: \(air.list.first!.components.no)"
//                self.NH3.text = "C0: \(air.list.first!.components.nh3)"
//                self.NO2.text = "C0: \(air.list.first!.components.no2)"
//                self.O3.text = "C0: \(air.list.first!.components.o3)"
//                self.PM10.text = "C0: \(air.list.first!.components.pm10)"
//                self.PM2.text = "C0: \(air.list.first!.components.pm2_5)"
//                self.SO2.text = "C0: \(air.list.first!.components.so2)"
                
            }
        }
    }

}

