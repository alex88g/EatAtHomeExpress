//
//  Cart.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-01-13.
//

import SwiftUI

struct Cart: Identifiable {
 
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
    
}
