//
//  HomeMap.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-03.
//

import SwiftUI
import CoreLocation


struct HomeMap: View {

    @StateObject var mapData = MapViewModel()
    //location manager
    @State var locationManager = CLLocationManager()
    
    
    var body: some View{
      
     
        
       
        ZStack{
            
            // MapView
            MapView()
            //using it as evironment object so that it can be used ints subViews
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
           
            
            VStack{
                
                
               
                
                VStack{
                    
                    Button(action: mapData.focusLocation, label: {
                        
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color(.white).opacity(0.25))
                            .clipShape(Circle())
                            .foregroundColor(.red)
                            .shadow(radius: 10)
                        
                    })
                    
                    Button(action: mapData.updateMapType, label: {
                        
                        Image(systemName: mapData.mapType ==
                            .standard ? "map.fill" : "map")
                        .font(.title2)
                        .padding(10)
                        .background(Color(.white).opacity(0.25))
                        .clipShape(Circle())
                        .foregroundColor(.red)
                        .shadow(radius: 10)
                        
                    })
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 55)
                .padding(.horizontal, 3)
              
                Spacer()
             
                
                VStack{
                    
                    VStack(spacing:0){
                        HStack{
                            
                            Image(systemName: "magnifynglass")
                                .foregroundColor(.gray)
                            
                            TextField("Sök i kartor", text: $mapData.searchTxt)
                                .colorScheme(.light)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        //                    .background(){
                        //                        RoundedRectangle(cornerRadius: 10)
                        //                            .fill(.ultraThickMaterial)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        
                        
                        //displaying results
                        
                        if !mapData.places.isEmpty && mapData.searchTxt
                            != ""{
                            
                            ScrollView{
                                
                                VStack(spacing: 15){
                                    
                                    ForEach(mapData.places){ place in
                                        
                                        Text(place.place.name ?? "")
                                        
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.leading)
                                            .onTapGesture {
                                                mapData.selectPlace(place: place)
                                            }
                                        
                                        Divider()
                                        
                                    }
                                    
                                }
                                .padding(.top)
                            }
                            .background(Color.white)
                        }
                        
                    }
                    .padding()
                    
                }
                
            }
                
            .onAppear(perform: {
                //settings delegate
                locationManager.delegate = mapData
                locationManager.requestWhenInUseAuthorization()
                
            })
            //permission denied alert
            .alert(isPresented: $mapData.permissionDenied, content: {
                
                Alert(title: Text("Permission Denied"), message: Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Go To Settings"), action: {
                    
                    //redigering user to settings
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    
                }))
            })
            //        .preferredColorScheme(.dark)
            
            .onChange(of: mapData.searchTxt, perform: { value in
                
                //searching places
                
                
                //you can use your own delay time to avoid continous search request
                
                let delay = 0.3
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay)
                {
                    
                    if value == mapData.searchTxt{
                        
                        //search
                        self.mapData.searchQuery()
                        
                    }
                }
                
                
            })
        }
    }
}
struct HomeMap_Previews: PreviewProvider {
    static var previews: some View {
        HomeMap()
    }
}
