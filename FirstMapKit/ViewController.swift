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
            
            locationManager.delegate = self
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            
            
        } else {
            // show allert letting the user know they have to turn it on
        }
    }
    
   
    // show current location of user
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    @IBAction func centerBarButtonPressed(_ sender: UIBarButtonItem) {
        //
        centerViewOnUserLocation()
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else {
            mapView.mapType = .satellite
        }
    }
    
   


}


extension ViewController: CLLocationManagerDelegate {


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        mapView.setRegion(region, animated: true)

        


    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("lacation update failed \(error)")
//    }
    
    
}
