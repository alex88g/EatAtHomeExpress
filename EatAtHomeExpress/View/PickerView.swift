//
//  PickerView.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-11.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct PickerView: View {
    
    @State var shown = false
    @State var beskrivning = ""
    @Environment(\.presentationMode) var present
    
    var body: some View {
        
        VStack(){
            
                
                Button(action:{present.wrappedValue.dismiss()}) {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .bold))
                    
                    Spacer()
                }
                .padding()
                Button(action: {
                    
                }){
                    NavigationLink(destination: CameraView()){
                        Image(systemName: "camera.fill")
                            .font(.system(size: 30, weight: .bold))
                    }}
                
                
                
                Text("Beskriv kort din händelse, så tar vi hand om ditt ärende")
                    .fontWeight(.bold)
                
                TextField("", text: self.$beskrivning)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Spacer()
                
                Button(action: {
                    
                    self.shown.toggle()
                    
                }){
                    Text("Upload Image")
                    
                }.sheet(isPresented: $shown) {
                    
                    imagePicker(shown: self.$shown)
                    
                }
            }.navigationBarBackButtonHidden(true)
        }}
struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
        
struct imagePicker : UIViewControllerRepresentable {
    
    func makeCoordinator() -> imagePicker.Coordinator {
        
        return imagePicker.Coordinator(parent1: self)
    }
    
    @Binding var shown : Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        
        
        let imagepic = UIImagePickerController()
        imagepic.sourceType = .photoLibrary
        imagepic.delegate = context.coordinator
        return imagepic
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context:
                                UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent : imagePicker!
        
        init(parent1 : imagePicker) {
            
            parent = parent1
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                
                parent.shown.toggle()
                
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
                                       [UIImagePickerController.InfoKey : Any]) {
                
                let image = info[.originalImage] as! UIImage
                
                
                let storage = Storage.storage()
                storage.reference().child("temp").putData(image.jpegData(compressionQuality: 0.35)!, metadata:
                nil){ (_, err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    print("success")
                }
                parent.shown.toggle()
                
            }
        }
    }
    
}
