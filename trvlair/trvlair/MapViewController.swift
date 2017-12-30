//
//  MapViewController.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var manager: CLLocationManager?
    
    var regionRadius: CLLocationDistance = 1000
    
    var mapAirport: Airport?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Airport Map"
        
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        
        mapView.delegate = self
        
    }
    
    func addPin(_ airport: Airport) {
        let latitude: Double = Double( (self.mapAirport?.latitude)!)!
        let longitude: Double = Double( (self.mapAirport?.longitude)!)!
        let name: String = ""
        let iata: String = ""
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = iata
        
        self.mapView.addAnnotation(annotation)
    }
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            manager?.stopUpdatingLocation()
        } else {
            manager?.requestAlwaysAuthorization()
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let appleMapsURL = "http://maps.apple.com/?q=\(String(describing: view.annotation?.coordinate.latitude)),\(String(describing: view.annotation?.coordinate.longitude))"
        UIApplication.shared.open(URL(string: appleMapsURL)!)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthStatus()
    }
}

extension MapViewController: MKMapViewDelegate {
    
}
