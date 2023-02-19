//
//  LocationView.swift
//  EatAtHomeExpressd
//
//  Created by Alexander Gallorini on 2023-02-15.
//


import SwiftUI
import MapKit




struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    @Environment(\.presentationMode) var present
   
    var body: some View{
        VStack{
            
          ZStack{
              
                    mapLayer
                
                VStack(spacing:0){
                    
                    backButton
                        .padding(.top)
                    
                    header
                        .padding()
                    Spacer()
                    locationsPreviewStack
                    
                   
                }
            }
        }
        // the sheet binding tro sheetLocation
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
            
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View{
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView{
    
    private var header: some View {
        
        VStack{
            
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + "," +
                     vm.mapLocation.restaurant)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height:55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading){
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                }
            }
            if vm.showLocationsList{
                LocationsListView()
                
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0,y:15)
    }
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius:10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                    
                }
            }
        }
    }
    
    private var backButton: some View{
        
        VStack{
            
                Button(action:{present.wrappedValue.dismiss()}) {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color(.red))
                    
                    Spacer()
                }
                .padding()
            }
        }
        
    }
    

