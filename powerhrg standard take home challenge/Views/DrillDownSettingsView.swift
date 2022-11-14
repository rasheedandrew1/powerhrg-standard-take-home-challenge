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
    @State var coverArtSize : CGFloat = Image.MyTheme.imageSize.imageSize2
    
    // state properties for room card
    @State var roomFieldHeaderFontSize : CGFloat = Font.MyTheme.FontSize1
    @State var roomFieldHeaderTextColor : Color = Color.MyTheme.TextColors.TextColorsLight
    @State var roomFieldTextColor : Color = Color.MyTheme.TextColors.TextColorsLight
    @State var roomFieldTextSize : CGFloat = Font.MyTheme.FontSize3
    @State var roomFieldBackgroundBorderColor: Color = Color.MyTheme.TextColors.TextColorsLight
    @State var roomFieldBackgroundBorderWidth: CGFloat = Rectangle.MyTheme.lineWidth1
    @State var roomFieldHeaderFontWeight : Font.Weight = Font.Weight.MyTheme.semiBoldFont
    @State var roomFieldFontWeight : Font.Weight = Font.Weight.MyTheme.regularFont
    
    // state properties for navigate button
    @State var navigationButtonColor: Color = Color.MyTheme.otherColors.primary
    @State var navigationButtonTextColor : Color = Color.MyTheme.TextColors.TextColorsLight
    @State var navigationButtonTextSize : CGFloat = Font.MyTheme.FontSize3
    @State var navigationButtonBackgroundBorderColor: Color = Color.MyTheme.TextColors.TextColorsLight
    @State var navigationButtonBackgroundBorderWidth: CGFloat = Rectangle.MyTheme.lineWidth1
    @State var leaveRoomButtonColor: Color = Color.MyTheme.statusColors.Error
    @State var nextButton : String = Image.MyTheme.Icons.nextButtonIcon
    @State var leaveRoomButtonName : String = Image.MyTheme.Icons.leaveRoomButtonIcon
    @State var navigationButtonFontWeight : Font.Weight = Font.Weight.MyTheme.semiBoldFont
   
    // state properties for save button
    @State var saveButtonTextSize: CGFloat = Font.MyTheme.FontSize1
    @State var saveButtonTextFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont
    @State var saveButtonTextColor: Color = Color.MyTheme.TextColors.TextColorsLight
    @State var saveButtonBackgroundColor: Color = Color.MyTheme.TextColors.TextColorsLight
    @State var saveButtonSectionColor: Color = Color.MyTheme.shadowColors.Shadow
    @State var saveButtonColorOpacity: Double = Color.MyTheme.opacity1
    
    var body: some View {
      roomDetailViewStack
      .navigationTitle(space.name)
      .navigationBarTitleDisplayMode(.automatic)
      .navigationBarHidden(true)
    }
}

// MARK: - preview
struct DrillDownSettingsView_Previews: PreviewProvider {
    static var someRoom = room(name: "room name", topic: "room topic", description: "purpose for the room,purpose for the room purpose for the room purpose for the room purpose for the room purpose for the room", active: true, members: [], roomPic: "r7")
    
    static var previews: some View {
        DrillDownSettingsView(space: someRoom)
    }
}

// MARK: - extension
extension DrillDownSettingsView {
    
 // MARK: - structure for room fields
 struct roomFields: View {
       let space : room
       @State var sectionName : String
       @State var roomName : String
       @Binding var roomFieldHeaderFontSize : CGFloat
       @Binding var roomFieldHeaderTextColor : Color
       @Binding var roomFieldTextColor : Color
       @Binding var roomFieldTextSize : CGFloat
       @Binding var roomFieldBackgroundBorderColor: Color
       @Binding var roomFieldBackgroundBorderWidth: CGFloat
       @Binding var roomFieldHeaderFontWeight : Font.Weight
       @Binding var roomFieldFontWeight : Font.Weight
       var body: some View {
           VStack(alignment: .leading, spacing: Spacer.myTheme.small){
       // section header name
           Text(sectionName)
           .font(.system(size: roomFieldHeaderFontSize))
           .fontWeight(roomFieldHeaderFontWeight)
           .foregroundColor(roomFieldHeaderTextColor)
       // section data
            HStack{ Text(roomName)
                    .foregroundColor(roomFieldTextColor)
                    .font(.system(size: roomFieldTextSize))
                    .fontWeight(roomFieldFontWeight)
                    Spacer()
                   }.padding(Spacer.myTheme.medium)
        // section background
                   .background(RoundedRectangle(cornerRadius: Rectangle.MyTheme.cornerRadius.medium)
                   .stroke(roomFieldBackgroundBorderColor, lineWidth: roomFieldBackgroundBorderWidth)
                   )
                   }.padding(Spacer.myTheme.medium)
       }
   }
    
 // MARK: - structure for navigation buttons
 struct navigationButtons: View {
    let space : room
    @State var buttonName : String
    @State var memberCountButton : Bool
    @State var leaveRoomButton : Bool
    @Binding var nextButton : String
    @Binding var navigationButtonTextColor : Color
    @Binding var navigationButtonTextSize : CGFloat
    @Binding var navigationButtonBackgroundBorderColor: Color
    @Binding var navigationButtonBackgroundBorderWidth: CGFloat
    @Binding var leaveRoomButtonColor: Color
    @Binding var leaveRoomButtonName : String
    @Binding var navigationButtonColor : Color
    @Binding var navigationButtonFontWeight : Font.Weight
    var body: some View {
        HStack (spacing: Spacer.myTheme.small){
    // Button name
    Text(buttonName)
    .foregroundColor(leaveRoomButton ? leaveRoomButtonColor : navigationButtonColor)
    .font(.system(size: navigationButtonTextSize))
    .fontWeight(navigationButtonFontWeight)
    
    // conditional statement to show either members count, leave room button icon or nothing.
     if memberCountButton{
      Text("(\(space.members.count))")
      .foregroundColor(navigationButtonColor)
      .font(.system(size: navigationButtonTextSize))
      .fontWeight(navigationButtonFontWeight)
      } else if leaveRoomButton {
      Image(systemName: leaveRoomButtonName)
      .foregroundColor(leaveRoomButtonColor)
      .font(.system(size: navigationButtonTextSize))
      .fontWeight(navigationButtonFontWeight)
      .rotationEffect(.degrees(90)) }
      Spacer()
            
    // conditional statement to show the right arrow icon if the buttton is not "leave room button".
      if !leaveRoomButton {
      Image(systemName: nextButton)
      .foregroundColor(navigationButtonColor)
      .font(.system(size: navigationButtonTextSize))
      .fontWeight(navigationButtonFontWeight) }
      }.padding(Spacer.myTheme.medium)
        
    // button background
      .background(RoundedRectangle(cornerRadius: Rectangle.MyTheme.cornerRadius.small)
      .stroke(navigationButtonBackgroundBorderColor, lineWidth: navigationButtonBackgroundBorderWidth)
      )
      .padding(Spacer.myTheme.medium)
    }
}
 
 // MARK: - custom navigation bar
 private var customNavBar : some View {
        Rectangle()
            .foregroundColor(saveButtonSectionColor)
            .opacity(saveButtonColorOpacity * 3)
            .frame(height: 100)
          }
    
 // MARK: - room cover art
 // cover art view
 private var coverArt : some View {
        Image(space.roomPic)
            .resizable()
            .aspectRatio(contentMode: .fill)
                .frame(width: coverArtSize, height: coverArtSize)
                .clipShape(RoundedRectangle(cornerRadius: Rectangle.MyTheme.cornerRadius.medium))
       }
    
    
 // MARK: - room fields
 // room name card
 private var roomName : some View {
     roomFields(space: space, sectionName: "Room Name", roomName: space.name, roomFieldHeaderFontSize: $roomFieldHeaderFontSize, roomFieldHeaderTextColor: $roomFieldHeaderTextColor, roomFieldTextColor: $roomFieldTextColor, roomFieldTextSize: $roomFieldTextSize, roomFieldBackgroundBorderColor: $roomFieldBackgroundBorderColor, roomFieldBackgroundBorderWidth: $roomFieldBackgroundBorderWidth, roomFieldHeaderFontWeight: $roomFieldHeaderFontWeight, roomFieldFontWeight: $roomFieldFontWeight)
}
    
 // room topic card
 private var roomTopic : some View {
        roomFields(space: space, sectionName: "Topic", roomName: space.topic, roomFieldHeaderFontSize: $roomFieldHeaderFontSize, roomFieldHeaderTextColor: $roomFieldHeaderTextColor, roomFieldTextColor: $roomFieldTextColor, roomFieldTextSize: $roomFieldTextSize, roomFieldBackgroundBorderColor: $roomFieldBackgroundBorderColor, roomFieldBackgroundBorderWidth: $roomFieldBackgroundBorderWidth, roomFieldHeaderFontWeight: $roomFieldHeaderFontWeight, roomFieldFontWeight: $roomFieldFontWeight)
    }
    
 // room description card
 private var roomDescription : some View {
        roomFields(space: space, sectionName: "Description", roomName: space.description, roomFieldHeaderFontSize: $roomFieldHeaderFontSize, roomFieldHeaderTextColor: $roomFieldHeaderTextColor, roomFieldTextColor: $roomFieldTextColor, roomFieldTextSize: $roomFieldTextSize, roomFieldBackgroundBorderColor: $roomFieldBackgroundBorderColor, roomFieldBackgroundBorderWidth: $roomFieldBackgroundBorderWidth, roomFieldHeaderFontWeight: $roomFieldHeaderFontWeight, roomFieldFontWeight: $roomFieldFontWeight)
    }
    
    
 // MARK: - navigation buttons
 // notification preference button card
 private var notificationPreferenceButton : some View {
     navigationButtons(space: space, buttonName: "Notification Preferences", memberCountButton: false, leaveRoomButton: false, nextButton: $nextButton, navigationButtonTextColor: $navigationButtonTextColor, navigationButtonTextSize: $navigationButtonTextSize, navigationButtonBackgroundBorderColor: $navigationButtonBackgroundBorderColor, navigationButtonBackgroundBorderWidth: $navigationButtonBackgroundBorderWidth, leaveRoomButtonColor: $leaveRoomButtonColor, leaveRoomButtonName: $leaveRoomButtonName, navigationButtonColor: $navigationButtonColor, navigationButtonFontWeight: $navigationButtonFontWeight)
    }
 
 // members button card
 private var membersButton : some View {
     NavigationLink(destination:roomMembersView(space: space))
     {navigationButtons(space: space, buttonName: "Members", memberCountButton: true, leaveRoomButton: false, nextButton: $nextButton, navigationButtonTextColor: $navigationButtonTextColor, navigationButtonTextSize: $navigationButtonTextSize, navigationButtonBackgroundBorderColor: $navigationButtonBackgroundBorderColor, navigationButtonBackgroundBorderWidth: $navigationButtonBackgroundBorderWidth, leaveRoomButtonColor: $leaveRoomButtonColor, leaveRoomButtonName: $leaveRoomButtonName, navigationButtonColor: $navigationButtonColor, navigationButtonFontWeight: $navigationButtonFontWeight)
     }
    }
    
 // leave room button card
 private var leaveRoomButton : some View {
     navigationButtons(space: space, buttonName: "Leave Room", memberCountButton: false, leaveRoomButton: true, nextButton: $nextButton, navigationButtonTextColor: $navigationButtonTextColor, navigationButtonTextSize: $navigationButtonTextSize, navigationButtonBackgroundBorderColor: $navigationButtonBackgroundBorderColor, navigationButtonBackgroundBorderWidth: $navigationButtonBackgroundBorderWidth, leaveRoomButtonColor: $leaveRoomButtonColor, leaveRoomButtonName: $leaveRoomButtonName, navigationButtonColor: $navigationButtonColor, navigationButtonFontWeight: $navigationButtonFontWeight)
         .onTapGesture {
             presentationMode.wrappedValue.dismiss()
         }
    }
 
    
 // MARK: - save button
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
                .fontWeight(saveButtonTextFontWeight)
                .textInputAutocapitalization(.sentences)
                .padding(Spacer.myTheme.medium)
                .padding(.horizontal, Spacer.myTheme.medium )
            // save button background
                .background(RoundedRectangle(cornerRadius: Rectangle.MyTheme.cornerRadius.medium)
                    .foregroundColor(saveButtonBackgroundColor)
                    .opacity(saveButtonColorOpacity)
                )
        }
       }
    
  // MARK: - room detail view stack
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
