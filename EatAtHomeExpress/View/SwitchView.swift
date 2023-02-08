//
//  SwitchView.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-08.
//

import SwiftUI

struct SwitchView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        VStack{
                 Picker("Mode", selection: $isDarkMode){
                     Text("Light")
                         .tag(false)
                     Text("Dark")
                         .tag(true)
                     
                 }.pickerStyle(SegmentedPickerStyle())
                     .padding()
                 
                 List(0..<5, id: \.self) { num in
                     NavigationLink(destination: Text("\(num)")) {
                         Text("\(num)")
                         
                     }
                  }

                 }
             }
             
         }
struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
