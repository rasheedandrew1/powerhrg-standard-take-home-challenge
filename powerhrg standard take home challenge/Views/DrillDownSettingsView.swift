//
//  DrillDownSettingsView.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/9/22.
//

import SwiftUI

struct DrillDownSettingsView: View {
   
    @Environment(\.presentationMode) var presentationMode
    let space : room
    
    // state properties for cover art
    @State var coverArtSize : CGFloat = 100
    
    // state properties for room field
    @State var roomFieldHeaderFontSize : CGFloat = 16
    @State var roomFieldHeaderTextColor : Color = Color .init("TextColorsLight")
    @State var roomFieldTextColor : Color = Color .init("TextColorsLight")
    @State var roomFieldTextSize : CGFloat = 14
    @State var roomFieldHeight : CGFloat = 40
    @State var roomFieldWidth : CGFloat = .infinity
    @State var roomFieldBackgroundBorderColor: Color = Color .init("TextColorsLight")
    @State var roomFieldBackgroundBorderWidth: CGFloat = 0.5
    
    // state properties for navigate button
    @State var navigationButtonColor: Color = .primary
    @State var navigationButtonTextColor : Color = Color .init("TextColorsLight")
    @State var navigationButtonTextSize : CGFloat = 14
    @State var navigationButtonHeight : CGFloat = 40
    @State var navigationButtonWidth : CGFloat = .infinity
    @State var navigationButtonBackgroundBorderColor: Color = Color .init("TextColorsLight")
    @State var navigationButtonBackgroundBorderWidth: CGFloat = 0.5
    @State var leaveRoomButtonColor: Color = Color .init("Error")
    @State var nextButton : String = "chevron.right"
    @State var leaveRoomButtonName : String = "square.and.arrow.up"
   
    // state properties for save button
    @State var saveButtonTextSize: CGFloat = 10
    @State var saveButtonTextColor: Color = Color .init("TextColorsLight")
    @State var saveButtonBackgroundColor: Color = Color .init("TextColorsLight")
    @State var saveButtonSectionColor: Color = Color .init("Shadow")
    @State var saveButtonColorOpacity: Double = 0.1
    @State var saveButtonBackgroundWidth : CGFloat = .infinity
    
    var body: some View {
      roomDetailViewStack
      .navigationTitle(space.name)
      .navigationBarTitleDisplayMode(.automatic)
      .navigationBarHidden(true)
    }
}

//MARK: preview
struct DrillDownSettingsView_Previews: PreviewProvider {
    static var someRoom = room(name: "room name", topic: "room topic", description: "purpose for the room,purpose for the room purpose for the room purpose for the room purpose for the room purpose for the room", active: true, members: [], roomPic: "r7")
    
    static var previews: some View {
        DrillDownSettingsView(space: someRoom)
    }
}

//MARK: extension
extension DrillDownSettingsView {
    
 //MARK: structure for room fields
 struct roomFields: View {
       let space : room
       @State var sectionName : String
       @State var roomName : String
       @Binding var roomFieldHeaderFontSize : CGFloat
       @Binding var roomFieldHeaderTextColor : Color
       @Binding var roomFieldTextColor : Color
       @Binding var roomFieldTextSize : CGFloat
       @Binding var roomFieldWidth : CGFloat
       @Binding var roomFieldBackgroundBorderColor: Color
       @Binding var roomFieldBackgroundBorderWidth: CGFloat
       var body: some View {
           VStack(alignment: .leading, spacing: 5){
       // section header name
           Text(sectionName)
           .font(.system(size: roomFieldHeaderFontSize))
           .fontWeight(.semibold)
           .foregroundColor(roomFieldHeaderTextColor)
       // section data
            HStack{ Text(roomName)
                    .foregroundColor(roomFieldTextColor)
                    .font(.system(size: roomFieldTextSize))
                    .fontWeight(.regular)
                    .textInputAutocapitalization(.sentences)
                    Spacer()
                   }.padding(10)
        // section background
                   .background(RoundedRectangle(cornerRadius: 3)
                   .stroke(roomFieldBackgroundBorderColor, lineWidth: roomFieldBackgroundBorderWidth)
                   )
                   }.padding(10)
       }
   }
    
 //MARK: structure for navigation buttons
 struct navigationButtons: View {
    let space : room
    @State var buttonName : String
    @State var memberCountButton : Bool
    @State var leaveRoomButton : Bool
    @Binding var nextButton : String
    @Binding var navigationButtonTextColor : Color
    @Binding var navigationButtonTextSize : CGFloat
    @Binding var navigationButtonWidth : CGFloat
    @Binding var navigationButtonBackgroundBorderColor: Color
    @Binding var navigationButtonBackgroundBorderWidth: CGFloat
    @Binding var leaveRoomButtonColor: Color
    @Binding var leaveRoomButtonName : String
    @Binding var navigationButtonColor : Color
    
    var body: some View {
    HStack (spacing: 5){
    // Button name
    Text(buttonName)
    .foregroundColor(leaveRoomButton ? leaveRoomButtonColor : navigationButtonColor)
    .font(.system(size: navigationButtonTextSize))
    .fontWeight(.semibold)
    
    // conditional statement to show either members count, leave room button icon or nothing.
     if memberCountButton{
      Text("(\(space.members.count))")
      .foregroundColor(navigationButtonColor)
      .font(.system(size: navigationButtonTextSize))
      .fontWeight(.semibold)
      } else if leaveRoomButton {
      Image(systemName: leaveRoomButtonName)
      .foregroundColor(leaveRoomButtonColor)
      .font(.system(size: navigationButtonTextSize))
      .fontWeight(.semibold)
      .rotationEffect(.degrees(90)) }
      Spacer()
            
    // conditional statement to show the right arrow icon if the buttton is not "leave room button".
      if !leaveRoomButton {
      Image(systemName: nextButton)
      .foregroundColor(navigationButtonColor)
      .font(.system(size: navigationButtonTextSize))
      .fontWeight(.semibold) }
      }.padding(10)
        
    // button background
      .background(RoundedRectangle(cornerRadius: 5)
      .stroke(navigationButtonBackgroundBorderColor, lineWidth: navigationButtonBackgroundBorderWidth)
      )
      .padding(10)
    }
}
 
 //MARK: custom navigation bar
 private var customNavBar : some View {
        Rectangle()
            .foregroundColor(saveButtonSectionColor)
            .opacity(saveButtonColorOpacity * 3)
            .frame(height: 100)
          }
    
 //MARK: room cover art
 // cover art view
 private var coverArt : some View {
        Image(space.roomPic)
            .resizable()
            .aspectRatio(contentMode: .fill)
                .frame(width: coverArtSize, height: coverArtSize)
                .clipShape(RoundedRectangle(cornerRadius: 10))
       }
    
    
 //MARK: room fields
 // room name card
 private var roomName : some View {
    roomFields(space: space, sectionName: "Room Name", roomName: space.name, roomFieldHeaderFontSize: $roomFieldHeaderFontSize, roomFieldHeaderTextColor: $roomFieldHeaderTextColor, roomFieldTextColor: $roomFieldTextColor, roomFieldTextSize: $roomFieldTextSize, roomFieldWidth: $roomFieldWidth, roomFieldBackgroundBorderColor: $roomFieldBackgroundBorderColor, roomFieldBackgroundBorderWidth: $roomFieldBackgroundBorderWidth)
}
    
 // room topic card
 private var roomTopic : some View {
        roomFields(space: space, sectionName: "Topic", roomName: space.topic, roomFieldHeaderFontSize: $roomFieldHeaderFontSize, roomFieldHeaderTextColor: $roomFieldHeaderTextColor, roomFieldTextColor: $roomFieldTextColor, roomFieldTextSize: $roomFieldTextSize, roomFieldWidth: $roomFieldWidth, roomFieldBackgroundBorderColor: $roomFieldBackgroundBorderColor, roomFieldBackgroundBorderWidth: $roomFieldBackgroundBorderWidth)
    }
    
 // room description card
 private var roomDescription : some View {
        roomFields(space: space, sectionName: "Description", roomName: space.description, roomFieldHeaderFontSize: $roomFieldHeaderFontSize, roomFieldHeaderTextColor: $roomFieldHeaderTextColor, roomFieldTextColor: $roomFieldTextColor, roomFieldTextSize: $roomFieldTextSize, roomFieldWidth: $roomFieldWidth, roomFieldBackgroundBorderColor: $roomFieldBackgroundBorderColor, roomFieldBackgroundBorderWidth: $roomFieldBackgroundBorderWidth)
    }
    
    
 //MARK: navigation buttons
 // notification preference button card
 private var notificationPreferenceButton : some View {
        navigationButtons(space: space, buttonName: "Notification Preferences", memberCountButton: false, leaveRoomButton: false, nextButton: $nextButton, navigationButtonTextColor: $navigationButtonTextColor, navigationButtonTextSize: $navigationButtonTextSize, navigationButtonWidth: $navigationButtonWidth, navigationButtonBackgroundBorderColor: $navigationButtonBackgroundBorderColor, navigationButtonBackgroundBorderWidth: $navigationButtonBackgroundBorderWidth, leaveRoomButtonColor: $leaveRoomButtonColor, leaveRoomButtonName: $leaveRoomButtonName, navigationButtonColor: $navigationButtonColor)
    }
 
 // members button card
 private var membersButton : some View {
     NavigationLink(destination:roomMembersView(space: space))
     {navigationButtons(space: space, buttonName: "Members", memberCountButton: true, leaveRoomButton: false, nextButton: $nextButton, navigationButtonTextColor: $navigationButtonTextColor, navigationButtonTextSize: $navigationButtonTextSize, navigationButtonWidth: $navigationButtonWidth, navigationButtonBackgroundBorderColor: $navigationButtonBackgroundBorderColor, navigationButtonBackgroundBorderWidth: $navigationButtonBackgroundBorderWidth, leaveRoomButtonColor: $leaveRoomButtonColor, leaveRoomButtonName: $leaveRoomButtonName, navigationButtonColor: $navigationButtonColor)
     }
    }
    
 // leave room button card
 private var leaveRoomButton : some View {
        navigationButtons(space: space, buttonName: "Leave Room", memberCountButton: false, leaveRoomButton: true, nextButton: $nextButton, navigationButtonTextColor: $navigationButtonTextColor, navigationButtonTextSize: $navigationButtonTextSize, navigationButtonWidth: $navigationButtonWidth, navigationButtonBackgroundBorderColor: $navigationButtonBackgroundBorderColor, navigationButtonBackgroundBorderWidth: $navigationButtonBackgroundBorderWidth, leaveRoomButtonColor: $leaveRoomButtonColor, leaveRoomButtonName: $leaveRoomButtonName, navigationButtonColor: $navigationButtonColor)
         .onTapGesture {
             presentationMode.wrappedValue.dismiss()
         }
    }
 
    
 //MARK: save button
 // save button card
 private var saveButton : some View {
        ZStack {
            Rectangle()
                .foregroundColor(saveButtonSectionColor)
                .opacity(saveButtonColorOpacity * 3)
                .frame(height: 100)
            Text("Save")
                .foregroundColor(saveButtonTextColor)
                .opacity(saveButtonColorOpacity * 3)
                .font(.system(size: saveButtonTextSize))
                .fontWeight(.bold)
                .textInputAutocapitalization(.sentences)
                .padding(10)
                .padding(.horizontal, 20)
            // save button background
                .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(saveButtonBackgroundColor)
                    .opacity(saveButtonColorOpacity)
                )
        }
       }
    
  //MARK: room detail view stack
  // room detail view stack
  private var roomDetailViewStack : some View {
    VStack{customNavBar
    ScrollView(.vertical, showsIndicators: false) {
                coverArt
                roomName
                roomTopic
                roomDescription
                notificationPreferenceButton
                membersButton
                leaveRoomButton
               Spacer(minLength: 100)
             }
            saveButton
        }.edgesIgnoringSafeArea(.all)
         .ignoresSafeArea()
          }
 
}
