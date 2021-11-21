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
        
        locationManager.delegate = self
        checkLocationServices()

 
    }
    
    // check location services are enabled
    func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            
            
        } else {
            // show allert letting the user know they have to turn it on
        }
    }
    
   
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    

    
   


}


extension ViewController: CLLocationManagerDelegate {


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        


    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("lacation update failed \(error)")
//    }
    
    
}
