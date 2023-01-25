//
//  Login.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-24.
//

import SwiftUI

struct Login: View {
    
    @State var username = ""
    @State var password = ""
    @State var wrongUsername = 0
    @State var wrongPassword = 0
    @State var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.red
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        // Autheticate user
                        autheticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    .zIndex(1)
                    
                  //  NavigationLink(isActive: $showingLoginScreen, destination: {Home()}, label: {Text("hej")})
                    
                   
                }.fullScreenCover(isPresented: $showingLoginScreen, content: {Home()})
            }
            .navigationBarHidden(true)
        }
    }
        func autheticateUser(username: String, password: String) {
            print("u: \(username), p: \(password)")
            if username == "Alex2023" {
                wrongUsername = 0
                
                if password == "Alex123" {
                    wrongPassword = 0
                    showingLoginScreen = true
                    print("login")
                } else {
                    wrongPassword = 2
                }
                
            } else {
                wrongUsername = 2
            }
        }
    }

