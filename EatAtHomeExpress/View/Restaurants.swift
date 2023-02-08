//
//  Restaurants.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-08.
//

import SwiftUI
import Firebase

struct Restaurants: View {
    
    @StateObject var PlacesModel = PlacesViewModel()
    
    
    
    var body: some View {
        
        
        ZStack{
            
            
            VStack(){

                HStack(){
                    
                    TextField("Sök för restauranger och rätter", text: $PlacesModel.search)
                    
                        .colorScheme(.light)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    
                    
                    Spacer()
                    
                    
                    if PlacesModel.search != ""{
                        
                        Button(action: {}, label: {
                            
                            Image(systemName:  "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            
                            
                        })
                        .animation(.easeIn)
                    }
                }
                
                .padding(.horizontal)
                .padding(.top,10)
                
                Divider()
                
                if PlacesModel.place.isEmpty{
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                }
                
                else{
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        VStack(spacing: 25){
                            
                            ForEach(PlacesModel.filtered){ place in
                                
                                // places view
                                
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                    
                                    PlacesView(place: place)
                                    
                                    HStack{
                                        
                                        Text("Boka din favorit stället")
                                            .foregroundColor(.black)
                                            .padding(.vertical,10)
                                            .padding(.horizontal)
                                            .background(Color(.yellow))
                                        
                                        Spacer(minLength: 0)
                                        

                                    }
                                    
                                    .padding(.trailing,10)
                                    .padding(.top,10)
                                    
                                })
                                
                                .frame(width: UIScreen.main.bounds.width - 30)
                                .foregroundColor(.red)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                                
                            }
                        }
                        
                        .padding(.top, 10)
                        
                        
                    })
                    
                }
                
            }
            
        }
        .onAppear(perform: {
            // calling location delegate
            PlacesModel.locationManager.delegate = PlacesModel
            
        })
        
        .onChange(of: PlacesModel.search, perform: { value in
            
            // to avoid continues search request
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                if value == PlacesModel.search && PlacesModel.search != ""{
                    
                    // search data
                    
                    PlacesModel.filterData()
                    
                }
            }
            
            if PlacesModel.search == ""{
                // reset all data
                withAnimation(.linear){PlacesModel.filtered = PlacesModel.place}
            }
            
        })
        
    }
}
