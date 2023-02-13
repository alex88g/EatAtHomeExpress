//
//  MapPlace.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-12.
//

import Foundation
import CoreLocation

struct MapPlace : Identifiable {
    var id = UUID()
    
    var name : String
    var latitude : Double
    var longitude : Double
    
    var coordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
}
