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
  @State var memberCountTextSize : CGFloat = Font.MyTheme.FontSize2
  @State var memberCountTextColor : Color = Color.MyTheme.dataColors.Data1
  @State var memberCountFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont
  @State var memberCountBackgroundBorderWidth: CGFloat = Circle.MyTheme.lineWidth2
    
  // state properties for empty members list message
  @State var emptyMembersListMessage : String = Text.MyMessage.NoMembers
      @State var emptyMembersListMessageTextColor : Color = Color.MyTheme.otherColors.gray
  @State var emptyMembersListMessageFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont
    
  var body: some View {
    membersListAndEmptyMembersListView
    .navigationTitle(space.name)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing:memberCount)
}
}

  // MARK: - preview
  struct roomMembersView_Previews: PreviewProvider {
    static var someRoom = room(name: "room name", topic: "room topic", description: "purpose for the room,purpose for the room purpose for the room purpose for the room purpose for the room purpose for the room", active: true, members: [], roomPic: "r7")
    
    static var previews: some View {
        roomMembersView(space: someRoom)
    }
}


  // MARK: - extension
  extension roomMembersView {
    
    // navigation bar member count
    private var memberCount : some View {
    Text("\(space.members.count)")
    .foregroundColor(memberCountTextColor)
    .fontWeight(memberCountFontWeight)
    .font(.system(size: memberCountTextSize))
    .padding(Spacer.myTheme.small)
    .background(Circle().stroke(memberCountTextColor, lineWidth: memberCountBackgroundBorderWidth))
    }
    
    // members list
    private var memberListView : some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(space.members) { user in
                    peopleSectionCardView(user: user)
                }
            }
        } .padding(Spacer.myTheme.medium)
    }
    
    // empty members list
    private var emptyMembersListView : some View {
        VStack{
            Spacer()
            Text(emptyMembersListMessage)
                .foregroundColor(emptyMembersListMessageTextColor)
                .multilineTextAlignment(.center)
                .font(.system(size: memberCountTextSize))
                .fontWeight(emptyMembersListMessageFontWeight)
            Spacer()
        Spacer()
        } .padding(Spacer.myTheme.medium)
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
