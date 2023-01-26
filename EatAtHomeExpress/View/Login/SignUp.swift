//
//  SignUp.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-26.
//

import SwiftUI
import Firebase

struct SignUp: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    
    
    var body: some View {
        
        
        ZStack{
            ZStack(alignment: .topLeading) {
                
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
                    
                    VStack{
                        
                        Image("logo")
                            .padding(.top, 35)
                        
                        
                        Text("Sign up to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(self.email != "" ? Color("red") : self.color,lineWidth: 2))
                            .padding(.top, 5)
                        
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
                        
                        HStack(spacing: 15){
                            
                            VStack {
                                
                                if self.revisible{
                                    
                                    TextField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)
                                    
                                }
                            }
                            
                            Button(action: {
                                
                                self.revisible.toggle()
                                
                            }) {
                                
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(self.repass != "" ? Color("red") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        
                        
                        Button(action: {
                            
                            self.register()
                            
                        }){
                            
                            Text("Register")
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
                    
                    self.show.toggle()
                    
                }){
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(self.color)
                    
                }
                .padding()
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
                
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
    func register(){
        
        if self.email != ""{
            
            if self.pass == self.repass{
                
                Auth.auth().createUser(withEmail: self.email, password: self.pass){
                    (res, err) in
                    
                    if err != nil{
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                        
                    }
                    
                    print("success")
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            } else{
                self.error = "Password mismatch"
                self.alert.toggle()
            }
            
        }
        else{
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
            
        }
    }
    
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

