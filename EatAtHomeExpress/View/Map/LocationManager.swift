//
//  LocationManager.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//


import Foundation
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var location : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func startLocationUpdates() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        print("Plats uppdaterad \(location)")
    }
}

