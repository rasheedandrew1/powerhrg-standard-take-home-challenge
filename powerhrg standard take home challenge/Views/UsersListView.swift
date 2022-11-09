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
    @State var navBarIconSize : CGFloat = 14
    @State var navBarIconColor : Color = Color.init("TextColorsLight")
    @State var navBarProfileButtonName : String = "person.crop.circle"
    @State var navBarEditButtonName : String = "square.and.pencil"
 
    // state properties for section header
    @State var sectionTitleColor : Color = Color .init("TextColorsLight")
    @State var sectionOpenButton : String = "chevron.down"
    @State var sectionCloseButton : String = "chevron.up"
    
    // state properties to display section details
    @State var showEvent : Bool = false
    @State var showRoom : Bool = false
    @State var showPeople : Bool = false
    
    
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

//MARK: preview
struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
        .environmentObject(usersListViewModel())
    }
}

//MARK: extensions
extension UsersListView {

    //MARK: section title structure
    struct sectionTitle: View {
        var title : String
        var fontSize : CGFloat
        var sectionCount : Int
        var showCount : Bool
        @Binding var sectionTitleColor : Color
        var body: some View {
            HStack (spacing: 4){
                Text(title)
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
                    .foregroundColor(sectionTitleColor)
                
                Text("(\(sectionCount))")
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
                    .foregroundColor(showCount ? sectionTitleColor : .clear)
                Spacer()
            }
        }
    }
    
    
    //MARK: navigation bar buttons
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
    
    
    //MARK: section header
    // event section header view
    private var eventsSectionHeader : some View {
        HStack  {
            sectionTitle(title: "EVENTS", fontSize: 14, sectionCount: 0, showCount: true, sectionTitleColor: $sectionTitleColor)
            Spacer()
            Image(systemName: showEvent ? sectionOpenButton : sectionCloseButton)
        }
        .padding(.all, 15)
        .onTapGesture {
            showPeople = false
            showRoom = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                showEvent.toggle()
            }
        }
    }
    
    // room section header view
    private var roomsSectionHeader : some View {
        HStack  {
            sectionTitle(title: "ROOMS", fontSize: 14, sectionCount: UsersListViewModel.roomsArray.count, showCount: true, sectionTitleColor: $sectionTitleColor)
            Spacer()
            Image(systemName: showRoom ? sectionOpenButton : sectionCloseButton)
        }
        .padding(.all, 15)
        .onTapGesture {
            showEvent = false
            showPeople = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showRoom.toggle()
            }
        }
    }
    
    // people section header view
    private var peopleSectionHeader : some View {
        HStack  {
            sectionTitle(title: "PEOPLE", fontSize: 14, sectionCount: 0, showCount: false, sectionTitleColor: $sectionTitleColor)
            Spacer()
            Image(systemName: showPeople ? sectionOpenButton : sectionCloseButton)
        }
        .padding(.all, 15)
        .onTapGesture {
            showRoom = false
            showEvent = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                showPeople.toggle()
            }
        }
    }
    
    
    //MARK: sections stack
    // event section stack
    private var eventSection : some View {
        VStack{
            eventsSectionHeader
            if showEvent {
                Text("There are no events at the moment. \n please check back later.")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.init("TextColorsLight"))
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
    
    
   //MARK: section Stack Card
    // vertical stack of all sections
    private var sectionStackView : some View {
        ScrollView(.vertical, showsIndicators: false) {
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
