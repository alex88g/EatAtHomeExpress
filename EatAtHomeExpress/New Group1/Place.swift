//
//  Place.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//

import Foundation
import MapKit


struct Place : Identifiable {
    
    var id = UUID().uuidString
    var place: CLPlacemark
}
   
