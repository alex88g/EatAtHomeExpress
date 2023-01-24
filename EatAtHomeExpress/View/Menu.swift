//
//  Menu.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-12.
//

import SwiftUI

struct Menu: View {
    @ObservedObject var homeData : HomeViewModel
    var body: some View {
        
        VStack{
            
            NavigationLink(destination: CartView(homeData: homeData)){
               
                HStack(spacing: 15){
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(Color("red"))
                    
                    Text("cart")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                
                .padding()
            }
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                Text("Version 0.1.6")
                    .fontWeight(.bold)
                    .foregroundColor(Color("red"))
            }
            
            .padding(10)
        }
        .padding([.top,.trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}
