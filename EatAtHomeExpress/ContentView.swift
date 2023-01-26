//
//  ContentView.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    
    var body: some View {
        
        NavigationView{
            
            TabView {
                Home()
                    .preferredColorScheme(.dark)
                //                    .navigationTitle("Home")
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                        
                    }
                MapView()
                    .tabItem{
                        Image(systemName: "map.fill")
                        Text("Map")
                        
                    }
                Text("List")
                    .tabItem{
                        Image(systemName: "list.star")
                        Text("List")
                        
                    }
                
                Text("Settings")
                    .tabItem{
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                            .accentColor(.red)
                   
                            
                            VStack{
                                
                                if self.status{
                                    
                                    Home()
                                       
                                    
                                }
                                else{
                                    
                                    ZStack{
                                        
                                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                                            
                                            Text("")
                                            
                                        }
                                        
                                        .hidden()
                                    }
                                    
                                    Login(show: self.$show)
                                    
                                }
                                
                            }
                            
                            
                        }
                        
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .onAppear{
                            
                            NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main){
                                (_) in self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                                
                            }
                        }
                    }
            }
        }
        
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        
           
    }
    
}
    
