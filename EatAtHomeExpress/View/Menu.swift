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
    
  
    var body: some View {
        
        VStack{
            
            NavigationLink(destination: CartView(homeData: homeData)){
               
                HStack(spacing: 15){
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(Color("red"))
                    
                    Text("cart")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    
                    Spacer(minLength: 0)
                }
                
                .padding()
                
            }
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                //Logout button with rectangle prtrait (exit) picture
                               Button(action: {
                                   
                                   try! Auth.auth().signOut()
                                   UserDefaults.standard.set(false, forKey: "status")
                                   NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                                   
                               }){
                                   
                                   Text( "Log out")
                                       .foregroundColor(.red)
                                       .fontWeight(.heavy)
                                   Image(systemName: "rectangle.portrait.and.arrow.right")
            
                                       .padding(.horizontal)
                                       .fontWeight(.heavy)
                               }
            }
            
            .padding(10)
        }
        .padding([.top,.trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.black.ignoresSafeArea())
        .opacity(0.80)
        
        
    }
  
  
}
