//
//  items.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-01.
//

import Foundation

import FirebaseFirestoreSwift

struct UserInfo : Codable, Identifiable {
    @DocumentID var id : String?
    var name : String
    var surname : String = ""
    var mobile : String = ""
    var adress : String = ""
//    var longitude : String = ""
//    var latitude : String = ""
    var done: Bool = false
}
