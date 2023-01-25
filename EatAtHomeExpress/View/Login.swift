//
//  Login.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-24.
//

import SwiftUI

struct Login: View {
    
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State var wrongEmail = 0
    
    var body: some View {
        
        NavigationView{
            
            ZStack(alignment: .topTrailing) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                    }
                    
                    Color.red
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.6)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.25)
                        .foregroundColor(.white)
                        .padding(.top, 220)
                    
                    GeometryReader{_ in
                        
                        
                        VStack{
                            
                            Image("logo")
                                .padding(.top, 35)

                            
                            Text("Log in to your account")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 15)
                            
                            TextField("Email", text: self.$email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).stroke(self.email != "" ? Color("red") : self.color,lineWidth: 2))
                                .padding(.top, 25)
                            HStack(spacing: 15){
                                
                                VStack {
                                    
                                    if self.visible{
                                        
                                        TextField("Password", text: self.$pass)
                                    }
                                    else{
                                        
                                        SecureField("Password", text: self.$pass)
                                        
                                    }
                                }
                                
                                Button(action: {
                                    
                                }) {
                                    
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(self.color)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(self.pass != "" ? Color("red") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                            
                            HStack{
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                }){
                                    Text("Forget password")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("red"))
                                }
                            }
                            .padding(.top, 20)
                            
                            Button(action: {
                                
                            }){
                                
                                Text("Log in")
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                                
                            }
                            
                            .background(Color("red"))
                            .cornerRadius(15)
                            .padding(.top, 25)
                            
                        }
                        
                        .padding(.horizontal, 25)
                    }
                    
                    Button(action: {
                        
                    }){
                        
                        Text("Register")
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                        
                    }
                    .padding(.top, 550)
                    .padding(.horizontal, 30)
                    
                }
                
            }
            
        }
        
    }
    
}
                    