//
//  ViewController.swift
//  FirstMapKit
//
//  Created by MacBook on 20.11.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // check location services are enabled
    func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            
        } else {
            // show allert letting the user know they have to turn it on
        }
    }
    
   


}


extension ViewController: CLLocationManagerDelegate {


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        


    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        <#code#>
    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("lacation update failed \(error)")
//    }
    
    
}
