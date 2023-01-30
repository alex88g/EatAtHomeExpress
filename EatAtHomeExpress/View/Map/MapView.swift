//
//  Map.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //location manager är delegate
    var locationManager = LocationManager()
    
    @State  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3323341, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.02))
    
    @State var places = [
        Place(name: "nice place", latitude: 37.3323341, longitude: -122.0312186),
        Place(name: "food", latitude: 37.3323341, longitude: -122.0312186),
        Place(name: "nice food", latitude: 37.3323341, longitude: -122.0312186),
    ]
    
    
    var body: some View {
        
        NavigationView{
        
            VStack{
                
                Map(coordinateRegion: $region,
                    interactionModes: [.all],
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow),
                    annotationItems: places) { place in
                    //MapPin(coordinate: place.coordinate)
                    //MapMarker(coordinate: place.coordinate)
                    
                    
                    
                    MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                        MapPinView(place : place)
                    }
                }
                
                Button(action: {
                    
                }){
                    Text("Add pin")
                }
                Button(action: {
                    locationManager.startLocationUpdates()
                }) {
                    Text("Start updates")
                }
            }
        }
    }
    func addPin(){
        let newPlace = Place(name: "New Place", latitude: 37.3323341, longitude: -122.0312186)
        
        if let location = locationManager.location{
            let newPlace = Place(name: "here",
                                 latitude: location.latitude,
                                 longitude: location.longitude)
            places.append(newPlace)
        }
        
        
    }
    
    
}
struct MapPinView: View {
    
    var place : Place
    
    var body: some View {
        VStack{
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 30, height: 30)
            Text(place.name)
        }
    }
}
