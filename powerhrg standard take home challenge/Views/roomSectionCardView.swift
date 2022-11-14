//
//  roomSectionCardView.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/10/22.
//

import SwiftUI

    struct roomSectionCardView: View {
   
    @EnvironmentObject var usersListViewModel: usersListViewModel
    let space : room
    
    // state person for room cover art
        @State var roomCoverArtSize : CGFloat = Image.MyTheme.imageSize.imageSize1
    
    // state properties for room name text
    @State var roomNameFontSize : CGFloat = Font.MyTheme.FontSize4
    @State var activeRoomNameFontSizeWeight : Font.Weight = Font.Weight.MyTheme.boldFont
    @State var inActiveRoomNameFontSizeWeight : Font.Weight = Font.Weight.MyTheme.boldFont
        @State var roomNameTextColor : Color = Color.MyTheme.TextColors.TextColorsDefalut
    
    // state properties for membercount
    @State var memberCountFontSize : CGFloat = Font.MyTheme.FontSize1
    @State var memberCountFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont
    @State var memberCountBackgroundSize : CGFloat = Circle.MyTheme.Circle3
    @State var memberCountBackground : Color = Color.MyTheme.actionColors.Actions
    @State var memberCountBackgroundClear : Color = Color.MyTheme.otherColors.clear
        @State var memberCountTextClear : Color = Color.MyTheme.otherColors.clear
    @State var memberCountTextWhite : Color = Color.MyTheme.otherColors.white
   
    
       var body: some View {
        roomCard
        .environmentObject(usersListViewModel)
    }
}

    // MARK: - preview
    struct roomSectionCardView_Previews: PreviewProvider {

static var someRoom = room(name: "room name", topic: "room topic", description: "purpose for the room", active: true, members: [], roomPic: "liberty")

static var previews: some View {
    roomSectionCardView(space: someRoom)
        .environmentObject(usersListViewModel())
        .previewLayout(.sizeThatFits)
}
}

    // MARK: - extension
    extension roomSectionCardView {
   
    // MARK: - room name structure
    struct roomName: View {
        let Room : room
        @Binding var roomNameFontSize : CGFloat
        @Binding var roomNameTextColor : Color
        @Binding var activeRoomNameFontSizeWeight : Font.Weight
        @Binding var inActiveRoomNameFontSizeWeight : Font.Weight
        
        var body: some View {
            Text(Room.name)
                .font(.system(size: roomNameFontSize))
                .fontWeight(Room.active ?   activeRoomNameFontSizeWeight : inActiveRoomNameFontSizeWeight)
                         .foregroundColor(roomNameTextColor)
        }
    }
    
    // MARK: - room cover art
    // room cover art
    private var roomCoverArt: some View {
        Image(space.roomPic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                    .frame(width: roomCoverArtSize, height: roomCoverArtSize)
                    .clipShape(Circle())
        }
    
    // MARK: - room name
    // room name
    private var roomNames: some View {
        roomName(Room: space, roomNameFontSize: $roomNameFontSize, roomNameTextColor: $roomNameTextColor, activeRoomNameFontSizeWeight: $activeRoomNameFontSizeWeight, inActiveRoomNameFontSizeWeight: $inActiveRoomNameFontSizeWeight)
        }
   
    
    // MARK: - room member count
    // room member count
    private var memberCount: some View {
           Circle()
                   .frame(width: memberCountBackgroundSize , height: memberCountBackgroundSize)
                   .foregroundColor(space.members.count <= 0 ? memberCountBackgroundClear : memberCountBackground)
                   .overlay(
                    Text( "\(space.members.count)")
                           .font(.system(size: memberCountFontSize))
                       .fontWeight(memberCountFontWeight)
                       .foregroundColor(space.members.count <= 0 ? memberCountTextClear : memberCountTextWhite)
                         )
           }
    
    // MARK: - room card
    // room card view
    private var roomCard: some View {
            HStack {
             roomCoverArt
             roomNames
             Spacer()
            memberCount
            }.padding(Spacer.myTheme.large)
       }
  
}
