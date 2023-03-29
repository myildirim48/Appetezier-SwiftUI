//
//  User.swift
//  Appeteziers
//
//  Created by YILDIRIM on 29.03.2023.
//

import Foundation

struct User:Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
    
}
