//
//  Login.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-24.
//

import SwiftUI
import Firebase

struct Login: View {
    
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    
    var body: some View {
        
        ZStack{
            
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
                                .autocapitalization(.none)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).stroke(self.email != "" ? Color("red") : self.color,lineWidth: 2))
                                .padding(.top, 25)
                            
                            HStack(spacing: 15){
                                
                                VStack {
                                    
                                    
                                    if self.visible{
                                        
                                        TextField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    }
                                    else{
                                        
                                        SecureField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                        
                                    }
                                    
                                }
                                
                                Button(action: {
                                    
                                    self.visible.toggle()
                                    
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
                                    
                                    self.reset()
                                    
                                }){
                                    Text("Forget password")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("red"))
                                }
                            }
                            .padding(.top, 20)
                            
                            Button(action: {
                                
                                self.verify()
                                
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
                    // button for register
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }){
                        
                        Text("Register")
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                        
                        
                    }
                    .padding(.top, 550)
                    .padding(.horizontal, 30)
                    
                }
                
            }
            
            if self.alert{
                
//                ErrorView(alert: self.$alert, error: self.$error)
            }
            
        }
        
    }
    func verify(){
        
        if self.email != "" && self.pass != ""{
            
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res,
                                                                              err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                
            }
            
        }
        else {
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
            
        }
        
    }
    
    
    func reset(){
        
        if self.email != "" {
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                    
                }
                
                self.error = "RESET"
                self.alert.toggle()
                
            }
            
        }
        else{
            
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
        
        
        struct ErrorView : View {
            
            @State var color = Color.black.opacity(0.7)
            @Binding var alert : Bool
            @Binding var error : String
            
            var body: some View{
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        HStack{
                            
                            Text(self.error == "RESET" ? "Message" : "Error")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(self.color)
                            
                            Spacer()
                            
                        }
                        
                        .padding(.horizontal, 25)
                        
                        Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                            .foregroundColor(self.color)
                            .padding(.top)
                            .padding(.horizontal, 25)
                        
                        Button(action: {
                            
                            self.alert.toggle()
                            
                            
                        }){
                            
                            Text(self.error == "RESET" ? "Ok" : "Cancel")
                                .foregroundColor(self.color)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                        }
                        
                        .background(Color("red"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                        
                    }
                    .padding(.vertical, 25)
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .background(Color.white)
                    .cornerRadius(15)
                    
                }
                .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
                
            }
            
        }
    }}


    
    

                    

    

                    
