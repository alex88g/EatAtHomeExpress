//
//  Itemm.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-14.
//


import Foundation

import FirebaseFirestoreSwift

struct Itemm : Codable, Identifiable {
    @DocumentID var id : String?
    var name : String
    var category : String = ""
    var done: Bool = false
}
