//
//  Map.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//

import SwiftUI
import MapKit

//
struct MapView: UIViewRepresentable {
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
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView?{
            
            if annotation.isKind(of: MKUserLocation.self) {return nil }
            //                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            //                annotationView!.canShowCallout = true
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

//custom pins

//excluding user blue circle
//class Coordinator: NSObject, MKMapViewDelegate{
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
//    MKAnnotationView?{
//
//        guard annotation is MKPointAnnotation else {return nil}
//
//        let identifier = "Annotation"
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//        if annotationView == nil {
//            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = true
//        }else{
//            annotationView!.annotation = annotation
//
//        }
//
//        return annotationView
//
//    }
//
//}
//}
