//
//  Location.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-15.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    let name: String
    let restaurant:String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let image: [String]
    let link: String
    
    // Identifiable
    var id: String{
        //name = Restaurant
        //restaurant = "Deli Di Luca"
        // id = ""
        name + restaurant
    }
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
