//
//  Menu.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-12.
//

import SwiftUI
import Firebase

struct Menu: View {
    @ObservedObject var homeData : HomeViewModel
    @State var color = Color.black
    
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        
       
            
            VStack{
                
                NavigationLink(destination: CartView(homeData: homeData)){
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(Color("red"))
                        
                        Text("Varukorg")
                            .fontWeight(.bold)
                        //                        .foregroundColor(.red)
                        
                        
                        Spacer(minLength: 0)
                    }
                    
                    .padding()
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }){
                    NavigationLink(destination: SwitchView()){
                        Image(systemName: "gearshape")
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        
                        Text( "Inställningar")
                        //                                .foregroundColor(.red)
                        
                        
                    }  .padding()
                    Spacer()
                }
                
              
               
                    Button(action: {
                    
                    
                    
                }){
                    NavigationLink(destination: PickerView()){
                        Image(systemName: "list.clipboard")
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        
                        Text( "Reklamation")
                        //                                .foregroundColor(.red)
                        
                        
                    }
                    
                    .padding()
                    Spacer()
                }
                
                
                //Logout button with rectangle portrait (exit) picture
                Button(action: {
                    
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    
                }){
                    
                    
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    
                        .padding(.horizontal)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                    
                    Text( "Logga ut")
                    //                        .foregroundColor(.red)
                        .fontWeight(.heavy)
                }
            }
            
            .padding(10)
            
            
            
            .accentColor(.primary)
            .padding([.top,.trailing])
            .frame(width: UIScreen.main.bounds.width / 1.6)
            .background((self.isDarkMode ? Color.black : Color.white).edgesIgnoringSafeArea(.all)).overlay(Rectangle().stroke(Color.primary, lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
            
        }}
    

    
