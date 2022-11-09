//
//  roomMembersView.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/11/22.
//

import SwiftUI

struct roomMembersView: View {
  @Environment(\.presentationMode) var presentationMode
  let space : room
   
  // state properties for naviagtion bar
  @State var memberCountTextSize : CGFloat = 12
  @State var memberCountTextColor : Color = Color.init("Data1")
    
  // state properties for empty members list message
  @State var emptyMembersListMessage : String = "There are no members \n in this room \n at the moment!!!"
    
    var body: some View {
        membersListAndEmptyMembersListView
        .navigationTitle(space.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:memberCount)
    }
}

//MARK: preview
struct roomMembersView_Previews: PreviewProvider {
    static var someRoom = room(name: "room name", topic: "room topic", description: "purpose for the room,purpose for the room purpose for the room purpose for the room purpose for the room purpose for the room", active: true, members: [], roomPic: "r7")
    
    static var previews: some View {
        roomMembersView(space: someRoom)
    }
}


//MARK: extension
extension roomMembersView {
    
    // navigation bar member count
    private var memberCount : some View {
    Text("\(space.members.count)")
    .foregroundColor(memberCountTextColor)
    .fontWeight(.bold)
    .font(.system(size: memberCountTextSize))
    .padding(5)
    .background(Circle().stroke(memberCountTextColor, lineWidth: 1))
    }
    
    // members list
    private var memberListView : some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(space.members) { user in
                    peopleSectionCardView(user: user)
                }
            }
        } .padding(10)
    }
    
    // empty members list
    private var emptyMembersListView : some View {
        VStack{
            Spacer()
            Text(emptyMembersListMessage)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .fontWeight(.bold)
            Spacer()
        Spacer()
        } .padding(10)
    }
    
    // members list and empty members list
    @ViewBuilder
    private var membersListAndEmptyMembersListView : some View {
        if space.members.count >= 1 {
            memberListView
            } else {
                emptyMembersListView
           }
    }
    
}
