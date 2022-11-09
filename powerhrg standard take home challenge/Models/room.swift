//
//  room.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/9/22.
//

import Foundation

struct room: Identifiable, Codable {
    let id: String
    let name: String
    let topic: String
    let description: String
    let active : Bool
    let members : [person]
    let roomPic : String
    
    init(id: String = UUID().uuidString, name: String, topic: String, description: String, active: Bool, members : [person], roomPic : String) {
        self.id = id
        self.name = name
        self.topic = topic
        self.description = description
        self.active = active
        self.members = members
        self.roomPic = roomPic
     }
}
