//
//  ViewController.swift
//  Nano5
//
//  Created by Gustavo Rigor on 22/02/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var lat: Float = 0.0
    var lon: Float = 0.0
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
        print("\(lat) | \(lon)")
    }


}

