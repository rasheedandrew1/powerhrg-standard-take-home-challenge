//
//  UsersListView.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/9/22.
//

import SwiftUI

    struct UsersListView: View {
 
    @StateObject var UsersListViewModel: usersListViewModel = usersListViewModel()
  
    // state properties for navigation bar
        @State var navBarIconSize : CGFloat = Image.MyTheme.iconSize.iconSize1
    @State var navBarIconColor : Color = Color.MyTheme.TextColors.TextColorsLight
        @State var navBarProfileButtonName : String = Image.MyTheme.Icons.profileButtonIcon
        @State var navBarEditButtonName : String = Image.MyTheme.Icons.navBarEditButtonIcon
 
    // state properties for section header
    @State var sectionTitleFontSize : CGFloat = Font.MyTheme.FontSize3
    @State var sectionTitleColor : Color = Color.MyTheme.TextColors.TextColorsLight
        @State var sectionOpenButton : String = Image.MyTheme.Icons.sectionOpenButtonIcon
        @State var sectionCloseButton : String = Image.MyTheme.Icons.sectionCloseButtonIcon
    @State var sectionFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont
    
    // state properties for event section
    @State var eventSectionMessageFontSize : CGFloat = Font.MyTheme.FontSize1
    @State var eventSectionMessage : String = Text.MyMessage.NoEvents
    @State var eventSectionMessageColor : Color = Color.MyTheme.TextColors.TextColorsLight
    
    // state properties to display section details
    @State var showEvent : Bool = Bool.MyTheme.negative
    @State var showRoom : Bool = Bool.MyTheme.negative
    @State var showPeople : Bool = Bool.MyTheme.negative
    
    
    var body: some View {
        NavigationView {
                sectionStackView
             .navigationTitle("")
             .navigationBarTitleDisplayMode(.inline)
             .navigationBarItems(
              leading: navBarProfileButton,
              trailing: navBarEditButton )
        }.environmentObject(UsersListViewModel)
     }
}

    // MARK: - preview
    struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
        .environmentObject(usersListViewModel())
    }
}

    // MARK: - extensions
    extension UsersListView {

    // MARK: - section title structure
    struct sectionTitle: View {
        var title : String
        var fontSize : CGFloat
        var sectionCount : Int
        var showCount : Bool
        @Binding var sectionTitleColor : Color
        @Binding var sectionFontWeight : Font.Weight
        var body: some View {
            HStack (spacing: 4){
                Text(title)
                    .font(.system(size: fontSize))
                    .fontWeight(sectionFontWeight)
                    .foregroundColor(sectionTitleColor)
                
                Text("(\(sectionCount))")
                    .font(.system(size: fontSize))
                    .fontWeight(sectionFontWeight)
                    .foregroundColor(showCount ? sectionTitleColor : .clear)
                Spacer()
            }
        }
    }
    
    
    // MARK: - navigation bar buttons
    // nav bar profile button
    private var navBarProfileButton : some View {
        Button(action: {
              
           }){Image(systemName: navBarProfileButtonName)
                   .font(.system(size: navBarIconSize))
                   .foregroundColor(navBarIconColor)
               }
    }
    
    // nav bar edit button
    private var navBarEditButton : some View {
        Button(action: {
              
           }){Image(systemName: navBarEditButtonName )
                   .font(.system(size: navBarIconSize))
                   .foregroundColor(navBarIconColor)
               }
    }
    
    
    // MARK: - section header
    // event section header view
    private var eventsSectionHeader : some View {
        HStack  {
            sectionTitle(title: "EVENTS", fontSize: sectionTitleFontSize, sectionCount: 0, showCount: Bool.MyTheme.positive, sectionTitleColor: $sectionTitleColor, sectionFontWeight: $sectionFontWeight)
            Spacer()
            Image(systemName: showEvent ? sectionOpenButton : sectionCloseButton)
        }
        .padding(.all, Spacer.myTheme.large)
        .onTapGesture {
            showPeople = Bool.MyTheme.negative
            showRoom = Bool.MyTheme.negative
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                showEvent.toggle()
            }
        }
    }
    
    // room section header view
    private var roomsSectionHeader : some View {
        HStack  {
            sectionTitle(title: "ROOMS", fontSize: sectionTitleFontSize, sectionCount: UsersListViewModel.roomsArray.count, showCount: Bool.MyTheme.positive, sectionTitleColor: $sectionTitleColor, sectionFontWeight: $sectionFontWeight)
            Spacer()
            Image(systemName: showRoom ? sectionOpenButton : sectionCloseButton)
        }
        .padding(.all, Spacer.myTheme.large)
        .onTapGesture {
            showEvent = Bool.MyTheme.negative
            showPeople = Bool.MyTheme.negative
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showRoom.toggle()
            }
        }
    }
    
    // people section header view
    private var peopleSectionHeader : some View {
        HStack  {
            sectionTitle(title: "PEOPLE", fontSize: sectionTitleFontSize, sectionCount: 0, showCount: Bool.MyTheme.negative, sectionTitleColor: $sectionTitleColor, sectionFontWeight: $sectionFontWeight)
            Spacer()
            Image(systemName: showPeople ? sectionOpenButton : sectionCloseButton)
        }
        .padding(.all, Spacer.myTheme.large)
        .onTapGesture {
            showRoom = Bool.MyTheme.negative
            showEvent = Bool.MyTheme.negative
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                showPeople.toggle()
            }
        }
    }
    
    
    // MARK: - sections stack
    // event section stack
    private var eventSection : some View {
        VStack{
            eventsSectionHeader
            if showEvent {
                Text(eventSectionMessage)
                    .font(.system(size: eventSectionMessageFontSize))
                    .fontWeight(sectionFontWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(eventSectionMessageColor)
            }
        }
     }
    
    //room section stack
    private var roomSection : some View {
        VStack{
            roomsSectionHeader
            if showRoom {
                ForEach(UsersListViewModel.roomsArray) { space in
                    NavigationLink(destination:DrillDownSettingsView(space: space))
                    {
                        roomSectionCardView(space: space)
                    }
                }
            }
        }
    }
    
    //people section stack
    private var peopleSection : some View {
        VStack{
            peopleSectionHeader
            if showPeople {
                ForEach(UsersListViewModel.usersArray) { user in
                    peopleSectionCardView(user: user)
                }
            }
        }
    }
    
    
    // MARK: - section Stack Card
    // vertical stack of all sections
    private var sectionStackView : some View {
        ScrollView(.vertical, showsIndicators: Bool.MyTheme.negative) {
            VStack {
                Divider()
                eventSection
                roomSection
                peopleSection
                Spacer()
            }
        }
    }
    
}
