//
//  Datatype.swift
//  App_List
//
//  Created by Lucas da Silva Reis on 21/10/23.
//

import Foundation

struct Listtype: Identifiable, Codable {
    var id: Int
    var name: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case url = "avatar_url"
    }
}
