//
//  LocationDataService.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-15.
//
import Foundation
import MapKit

class LocationsDataService{
    
    static let locations: [Location] = [
    
        Location(name: "Restaurant", restaurant: "Deli Di Luca", coordinates: CLLocationCoordinate2D(latitude:18.08394, longitude: 59.31604), description: "Deli Di Luca är en restaurang som erbjuder Italiensk vällagad mat med de bästa råvarorna.", image: ["Deli Di Luca"], link: "https://firebasestorage.googleapis.com/v0/b/shoppinglist-d9ac3.appspot.com/o/Restauranger%2FDeli%20Di%20Luca.jpeg?alt=media&token=42f79ae4-576b-4afd-93ba-8e7ddc2b20bf"),
       
        Location(name: "Restaurant", restaurant: "Primo Cao Cao Nytorget", coordinates: CLLocationCoordinate2D(latitude: 18.08248, longitude: 59.31367), description: "Med passion och kärlek serverar vi väl genomtänkta smakkombinationer.", image: ["Primo Cao Cao Nytorget"], link: "https://firebasestorage.googleapis.com/v0/b/shoppinglist-d9ac3.appspot.com/o/Restauranger%2FPrimo%20Cao%20Cao%20Nytorget.jpeg?alt=media&token=e1d8cc13-da97-4b19-9556-aaad01be810f"),
        
        Location(name: "Restaurant", restaurant: "Olja&Oliv Deli, Kök & Bar", coordinates: CLLocationCoordinate2D(latitude: 18.09082, longitude: 59.31489), description: "Med passion och kärlek serverar vi väl genomtänkta smakkombinationer.", image: ["Olja&Oliv Deli, Kök & Bar"], link: "https://firebasestorage.googleapis.com/v0/b/shoppinglist-d9ac3.appspot.com/o/Restauranger%2FDeli%20Di%20Luca.jpeg?alt=media&token=42f79ae4-576b-4afd-93ba-8e7ddc2b20bf"),
        
        Location(name: "Restaurant", restaurant: "O'PIZZICATO", coordinates: CLLocationCoordinate2D(latitude: 18.06515, longitude: 59.31411), description: "Familjedriven restaurang som serverar klassiska italienska specialiteter i en ljus och modern miljö.", image: ["O'PIZZICATO"], link: "https://firebasestorage.googleapis.com/v0/b/shoppinglist-d9ac3.appspot.com/o/Restauranger%2FO'PIZZICATO.jpeg?alt=media&token=34dbf7e2-be4f-4058-8029-987f00e8b317"),
        
        Location(name: "Restaurant", restaurant: "La Perla", coordinates: CLLocationCoordinate2D(latitude: 18.06973, longitude: 59.31364), description: "Fantastiskt mysig miljö och mycket god pasta. ", image: ["La Perla"], link: "https://firebasestorage.googleapis.com/v0/b/shoppinglist-d9ac3.appspot.com/o/Restauranger%2FLa%20Perla.jpeg?alt=media&token=536a82e3-1387-4438-bc08-15fab3880afa"),
   
    ]
    
    
}
