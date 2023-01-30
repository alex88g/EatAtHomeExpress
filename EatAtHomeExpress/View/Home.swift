//
//  Home.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-12.
//

import SwiftUI
import Firebase

struct Home: View {
    @StateObject var HomeModel = HomeViewModel()
    @State var color = Color.black
    
    
    
    
    var body: some View {
        
        NavigationView{
            
            
            
            ZStack{
                
                
                VStack(spacing: 10){
                    
                    
                    HStack(spacing: 15){
                        
                        Button(action: {
                            withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                        }, label: {
                            
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(Color("red"))
                            
                        })
                        Text(HomeModel.userLocation == nil ? "Locating..." : "Deliver To")
                            .foregroundColor(.black)
                        
                        Text(HomeModel.userAdress)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("red"))
                        Spacer(minLength: 0)
                        //
                        
                        Button(action: {
                            
                            
                        }){
                            NavigationLink(destination: MapView()){
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.red)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 35)
                                
                                
                                
                            }}}
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        
                        TextField("Search", text: $HomeModel.search)
                            .frame(height: 35)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 15))
                            .foregroundColor(.white)
                            
                            
                            
                            
                        
                        if HomeModel.search != ""{
                            
                            Button(action: {}, label: {
                                
                                Image(systemName:  "magnifyingglass")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                
                                
                                
                            })
                            .animation(.easeIn)
                        }
                    }
                    
                    .padding(.horizontal)
                    .padding(.top,10)
                    
                    Divider()
                    
                    if HomeModel.items.isEmpty{
                        
                        Spacer()
                        
                        ProgressView()
                        
                        Spacer()
                    }
                    
                    else{
                        ScrollView(.vertical, showsIndicators: false, content: {
                            
                            VStack(spacing: 25){
                                
                                ForEach(HomeModel.filtered){ item in
                                    
                                    // item view
                                    
                                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                        
                                        ItemView(item: item)
                                        
                                        HStack{
                                            
                                            Text("FREE DELIVERY")
                                                .foregroundColor(.white)
                                                .padding(.vertical,10)
                                                .padding(.horizontal)
                                                .background(Color("red"))
                                            
                                            Spacer(minLength: 0)
                                            
                                            Button(action: {
                                                HomeModel.addToCart(item: item)
                                                
                                            }, label: {
                                                
                                                Image(systemName: item.isAdded ? "checkmark" : "plus")
                                                    .foregroundColor(.white)
                                                    .padding(10)
                                                    .background(item.isAdded ? Color.green: Color ("red"))
                                                    .clipShape(Circle())
                                            })
                                            
                                        }
                                        
                                        .padding(.trailing,10)
                                        .padding(.top,10)
                                        
                                    })
                                    
                                    .frame(width: UIScreen.main.bounds.width - 30)
                                }
                            }
                            
                            .padding(.top, 10)
                            
                        })
                    }
                }
                // side menu
                
                HStack{
                    
                    
                    
                    Menu(homeData: HomeModel)
                    
                    // move effect from left
                        .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                    
                    
                    Spacer(minLength: 0)
                }
                
                .background(Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea())
                //closing when taps on outside
                .onTapGesture(perform: {
                    withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                })
                
                
                
                // non closable alert if permission denied
                
                if HomeModel.noLocation{
                    
                    Text("Please Enable Location Access In Settings To Further Move On !!!")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color.black.opacity(0.3).ignoresSafeArea())
                    
                }
                
                
            }
            
            
            .onAppear(perform: {
                // calling location delegate
                HomeModel.locationManager.delegate = HomeModel
                
            })
            
            .onChange(of: HomeModel.search, perform: { value in
                
                // to avoid continues search request
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    if value == HomeModel.search && HomeModel.search != ""{
                        
                        // search data
                        
                        HomeModel.filterData()
                        
                    }
                }
                
                if HomeModel.search == ""{
                    // reset all data
                    withAnimation(.linear){HomeModel.filtered = HomeModel.items}
                }
                
            })
            
           
        }
       
    }
                       
        
                    }
        
                    
//                }
//            }
//
