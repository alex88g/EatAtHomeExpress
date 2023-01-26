//
//  Place.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//

import Foundation
import CoreLocation

struct Place : Identifiable {
    var id = UUID()
    
    var name : String
    var latitude : Double
    var longitude : Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
