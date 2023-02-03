//
//  CartView.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-13.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack{
            
            HStack(spacing: 20){
                
                Button(action:{present.wrappedValue.dismiss()}) {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color("red"))
                }
                
                Text("My cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer()
                
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVStack(spacing: 0){
                    
                    ForEach(homeData.cartItems){ cart in
                        
                        // CartItemView
                        
                        HStack(spacing: 15){
                            
                            WebImage(url: URL(string: cart.item.item_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 130)
                                .cornerRadius(15)
                               
                            
                            
                            VStack(alignment: .leading, spacing: 10){
                                
                                Text(cart.item.item_name)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                
                                Text(cart.item.item_details)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                
                                HStack(spacing: 15){
                                    
                                    Text(homeData.getPrice(value: Float(truncating: cart.item.item_cost)))
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                    
                                    Spacer(minLength: 0)
                                    
                                    // add - sub button
                                    
                                    Button(action: {
                                        if cart.quantity > 1{
                                            homeData.cartItems [homeData.getIndex(item: cart.item,isCartIndex: true) ].quantity -= 1
                                            
                                        }
                                        
                                    }) {
                                        
                                        Image(systemName: "minus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(Color("red"))
                                                                                        
                                        
                                    }
                                    
                                    Text("\(cart.quantity)")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                        .padding(.vertical,5)
                                        .padding(.horizontal,10)
                                        .background(Color.gray.opacity(0.06))
                                    
                                    Button(action: {
                                        
                                        homeData.cartItems [homeData.getIndex(item: cart.item,isCartIndex: true) ].quantity += 1
                                        
                                        
                                    }) {
                                        
                                        Image(systemName: "plus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(Color("red"))
                                            
                                    }
                                    
                                }
                                
                            }
                            .padding()
                            
                                                        .contextMenu{
                                
                                // for deleting
                                Button(action: {
                                    // deleting items from cart
                                    let index = homeData.getIndex(item: cart.item, isCartIndex: true)
                                    let itemIndex = homeData.getIndex(item: cart.item, isCartIndex: false)
                                    
                                    homeData.items[itemIndex].isAdded = false
                                    homeData.filtered[itemIndex].isAdded = false
                                    
                                    homeData.cartItems.remove(at: index)
                                    
                                }){
                                    Text("Remove")
                                }
//                                .background(.white)
//                                .opacity(0.35)
                            }
                        }
                    }
                }
                
                // Bottom view
                
                VStack{
                    
                    HStack{
                        
                        Text("Total:")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        //calculating total price
                        Text(homeData.calculateTotalPrice())
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .padding([.top,.horizontal])
                    
                    Button(action: homeData.updateOrder) {
                        
                        Text(homeData.ordered ? "Cancel Order" : "Check out")
                            
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.bottom, 0)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color("red"))
                            .cornerRadius(15)
                    }
                }
                
                .background(Color(.white).opacity(0.25))
                .cornerRadius(15)
                
            
                
                
                
                
            }
            
            .background(Color("").ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

