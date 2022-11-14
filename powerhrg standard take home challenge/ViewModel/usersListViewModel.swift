//
//  usersListViewModel.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/9/22.
//

import Foundation
class usersListViewModel: ObservableObject {

    
    @Published var usersArray: [person] = [] {
        didSet{
         
        }
    }
    @Published var roomsArray: [room] = [] {
    didSet{
        
    }
}
    
    // MARK: - usersListViewModel initializer
    init() {
        fetchUsers()
        fetchRooms()
    }
    
    
    // MARK: - functions for fetching users and rooms
    func fetchUsers() {
        let newUser = [
            person(name: ["John The Baptist"], role: "junior Adviser", profilePic: "u1", active: false, notifications: 6),
           
            person(name: ["John A,", "Kevin C,", "Kevin P"], role: nil, profilePic: "u2", active: false, notifications: 0),
           
            person(name: ["Micheal Jackson"], role: "PHL . Lead Nitro Ninja", profilePic: "u3", active: true, notifications: 0),
           
            person(name: ["Max J. Franco"], role: nil, profilePic: "u7", active: false, notifications: 0),
           
            person(name: ["wisdom I,", "Mike V"], role: nil, profilePic: "u5", active: false, notifications: 9),
           
            person(name: ["Daymon John"], role: "Chief of Design", profilePic: "u8", active: true, notifications: 95),
        ]
        usersArray.append(contentsOf: newUser)
    }
    
    func fetchRooms() {
        let newRoom = [
            room(name: "S.H.I.E.L.D (Support Ninjas)", topic: "All things support", description: "Support room where Ninjas discuss all things related to supporting the business.", active: false, members: [ person(name: ["John The Baptist"], role: "product development consultant", profilePic: "u1", active: true, notifications: 7), person(name: ["John The Baptist 2"], role: nil, profilePic: "u2", active: true, notifications: 7),], roomPic: "r1"),
          
            room(name: "System Operations", topic: "All things support", description: "Support room where Ninjas discuss all things related to supporting the business.", active: true, members: [ person(name: ["John The Baptist"], role: "Artist manager", profilePic: "u1", active: true, notifications: 6), person(name: ["John The Baptist 2"], role: "serurity analyst", profilePic: "u2", active: false, notifications: 50), person(name: ["John The Baptist 2"], role: nil, profilePic: "u3", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: "janitor", profilePic: "u4", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: nil, profilePic: "u5", active: true, notifications: 5), person(name: ["John The Baptist 2"], role: nil, profilePic: "u6", active: false, notifications: 2), person(name: ["John The Baptist 2"], role: nil, profilePic: "u7", active: false, notifications: 0),person(name: ["John The Baptist 2"], role: nil, profilePic: "u8", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: nil, profilePic: "u2", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: nil, profilePic: "u3", active: false, notifications: 4),], roomPic: "r2"),
          
            room(name: "Ninja Announcements", topic: "All things support", description: "Support room where Ninjas discuss all things related to supporting the business.", active: false, members: [], roomPic: "r6"),
        
            room(name: "Birds of prey team", topic: "All things support", description: "Support room where Ninjas discuss all things related to supporting the business.", active: false, members: [], roomPic: "r3"),
            
            room(name: "S.H.I.E.L.D (Support Ninjas)", topic: "All things support", description: "Support room where Ninjas discuss all things related to supporting the business.", active: true, members: [ person(name: ["John The Baptist"], role: nil, profilePic: "u1", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: nil, profilePic: "u2", active: false, notifications: 3), person(name: ["John The Baptist 2"], role: nil, profilePic: "u3", active: false, notifications: 3), person(name: ["John The Baptist 2"], role: nil, profilePic: "u4", active: false, notifications: 0),], roomPic: "r4"),
          
            room(name: "System Operations", topic: "All things support", description: "Support room where Ninjas discuss all things related to supporting the business.", active: true, members: [ person(name: ["John The Baptist"], role: nil, profilePic: "liberty", active: false, notifications: 1), person(name: ["John The Baptist 2"], role: nil, profilePic: "liberty", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: nil, profilePic: "liberty", active: false, notifications: 0), person(name: ["John The Baptist 2"], role: "janitor", profilePic: "liberty", active: false, notifications: 8), person(name: ["John The Baptist 2"], role: nil, profilePic: "liberty", active: false, notifications: 3), person(name: ["John The Baptist 2"], role: nil, profilePic: "liberty", active: false, notifications: 9), person(name: ["John The Baptist 2"], role: nil, profilePic: "liberty", active: false, notifications: 0),], roomPic: "r5"),
        ]
        roomsArray.append(contentsOf: newRoom)
        }
    }
    
