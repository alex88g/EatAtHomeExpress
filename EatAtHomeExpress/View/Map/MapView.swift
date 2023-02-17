//
//  Map.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//

import SwiftUI
import MapKit
import CoreLocation

//
    
struct MapView: UIViewRepresentable {
    @State var places = [
        MapPlaces(image:"",name: "Deli Di Luca", latitude:18.08394, longitude: 59.31604),
        MapPlaces(image:"",name: "Primo Ciao Ciao Nytorget", latitude: 18.08248, longitude: 59.31367),
        MapPlaces(image:"",name: "Olja&Oliv Deli, Kök & Bar", latitude: 18.09082, longitude: 59.31489),
        MapPlaces(image:"",name: "O'PIZZICATO", latitude: 18.06515, longitude: 59.31411),
        MapPlaces(image:"",name: "La Perla", latitude: 18.06973, longitude: 59.31364),
    ]
    
    @EnvironmentObject var mapData: MapViewModel
    

    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let view = mapData.mapView
        
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        //custom pins

        //excluding user circle
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView?{
            
            if annotation.isKind(of: MKUserLocation.self) {return nil }
                    
            else{
                let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_VIEW")
                pinAnnotation.tintColor = .red
                pinAnnotation.animatesDrop = true
                pinAnnotation.canShowCallout = true
                
                return pinAnnotation
                
                
            }
            
        }
        
        
        
    }
}


