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
    @State var roomCoverArtSize : CGFloat = 40
    
    // state properties for room name text
    @State var roomNameFontSize : CGFloat = 15
    @State var roomNameTextColor : Color = Color .init("TextColorsDefalut")
    
    // state properties for membercount
    @State var memberCountFontSize : CGFloat = 10
    @State var memberCountBackgroundSize : CGFloat = 20
    @State var memberCountBackground : Color = Color.init("Actions")
   
    
       var body: some View {
        roomCard
        .environmentObject(usersListViewModel)
    }
}

//MARK: preview
struct roomSectionCardView_Previews: PreviewProvider {
    
    static var someRoom = room(name: "room name", topic: "room topic", description: "purpose for the room", active: true, members: [], roomPic: "liberty")
    
    static var previews: some View {
        roomSectionCardView(space: someRoom)
            .environmentObject(usersListViewModel())
            .previewLayout(.sizeThatFits)
    }
}

//MARK: extension
extension roomSectionCardView {
   
    //MARK: room name structure
    struct roomName: View {
        @Binding var roomNameFontSize : CGFloat
        @Binding var roomNameTextColor : Color
        let Room : room
        var body: some View {
            Text(Room.name)
                .font(.system(size: roomNameFontSize))
                .fontWeight(Room.active ?   .heavy : .regular)
                         .foregroundColor(roomNameTextColor)
        }
    }
    
    //MARK: room cover art
    // room cover art
    private var roomCoverArt: some View {
        Image(space.roomPic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                    .frame(width: roomCoverArtSize, height: roomCoverArtSize)
                    .clipShape(Circle())
        }
    
    //MARK: room name
    // room name
    private var roomNames: some View {
        roomName(roomNameFontSize: $roomNameFontSize, roomNameTextColor: $roomNameTextColor, Room: space)
        }
   
    
    //MARK: room member count
    // room member count
    private var memberCount: some View {
           Circle()
                   .frame(width: memberCountBackgroundSize , height: memberCountBackgroundSize)
                   .foregroundColor(space.members.count <= 0 ? .clear : memberCountBackground)
                   .overlay(
                    Text( "\(space.members.count)")
                           .font(.system(size: memberCountFontSize))
                       .fontWeight(.bold)
                       .foregroundColor(space.members.count <= 0 ? .clear :.white)
                         )
           }
    
    //MARK: room card
    // room card view
    private var roomCard: some View {
            HStack {
             roomCoverArt
             roomNames
             Spacer()
            memberCount
            }.padding(15)
       }
  
}
