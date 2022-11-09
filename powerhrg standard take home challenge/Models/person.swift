//
//  person.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/9/22.
//

import Foundation

struct person: Identifiable, Codable {
    let id: String
    let name: [String]
    let role: String?
    let profilePic : String
    let online : Bool
    let notifications : Int
    
    init(id: String = UUID().uuidString, name: [String], role : String?,  profilePic : String, active: Bool, notifications : Int) {
        self.id = id
        self.name = name
        self.role = role
        self.profilePic = profilePic
        self.online = active
        self.notifications = notifications
     }
}
