//
//  profilePic.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/9/22.
//

import SwiftUI

struct peopleSectionCardView: View {
    
    @EnvironmentObject var usersListViewModel: usersListViewModel
    let user : person
    
    // state properties for user profile picture
    @State var userProfilePicSize : CGFloat = 40
    
    // state properties for user profile online status
    @State var userOnlineColor : Color = Color.init("Success")
    @State var userOnlineBorderColor : Color = Color.init("Border")
    @State var userOnlineCircleFrameSize : CGFloat = 8
    
    // state properties for user count status
    @State var userCountStatusColor : Color = Color.init("SuccessSubtle")
    @State var userCountStatusTextColor : Color = Color.init("Actions")
    @State var userCountStatusBorderColor : Color = Color.init("Border")
    @State var userCountStatusCircleFrameSize : CGFloat = 18
    
    // state properties for users name
    @State var userNameFontSize : CGFloat = 15
    @State var userNameTextColor : Color = Color .init("TextColorsDefalut")
    
    // state properties for user role
    @State var userRolefontSize : CGFloat = 12
    @State var userRoleTextColor : Color = Color .init("TextColorsDefalut")
    
    // state properties for user notifications
    @State var userNotificationFontSize : CGFloat = 10
    @State var userNotificationBackgroundSize : CGFloat = 20
    @State var userNotificationBackground : Color = Color.init("Actions")
    
    var body: some View {
          personCard
         .environmentObject(usersListViewModel)
        }
    }

//MARK: preview
struct peopleSectionCardView_Previews: PreviewProvider {
    static var someUser = person(name: ["joe Biden", "Kamala Harris",], role: "president & Vice president", profilePic: "liberty", active: true, notifications: 5)
    
    static var previews: some View {
        peopleSectionCardView(user: someUser)
        .environmentObject(usersListViewModel())
        .previewLayout(.sizeThatFits)
    }
}

//MARK: extension
extension peopleSectionCardView {
   
    // MARK: users name structure
    struct usersNameView: View {
        let user: person
        @Binding var userNameFontSize : CGFloat
        @Binding var userNameTextColor : Color
        
        var body: some View {
            HStack{
                ForEach(user.name.indices,  id: \.self) { item in
                    Text(user.name[item])
                        .font(.system(size: userNameFontSize))
                                 .fontWeight(.bold)
                                 .foregroundColor(userNameTextColor)
                                 .lineLimit(1)
                }
             }
         }
    }
  
    
    // MARK: users role structure
    struct usersRoleView: View {
        let user: person
        @Binding var userRolefontSize : CGFloat
        @Binding var userRoleTextColor : Color
        var body: some View {
            Text(user.role ?? "")
                .font(.system(size: userRolefontSize))
                         .fontWeight(.regular)
                         .foregroundColor(userRoleTextColor )
        }

    }
    
    
    // MARK: users profile pic, online status and count variables
    // user profile pic
    private var userProfilePic: some View {
        Image(user.profilePic)
            .resizable()
            .aspectRatio(contentMode: .fill)
                .frame(width: userProfilePicSize, height: userProfilePicSize)
                .clipShape(Circle())
                .overlay {
                   userOnlineAndCountStatusStack
                }
    }
    
    // user online status view
    @ViewBuilder
    private var userOnlineStatusView: some View {
        if user.online {
            HStack{Spacer()
                Circle()
                    .foregroundColor(userOnlineColor)
                    .frame(width: userOnlineCircleFrameSize)
                    .background {Circle()
                            .stroke(userCountStatusBorderColor, lineWidth: 3)
                    }
            }.padding(.horizontal, 2.5)
        }
   }
    
    // user count status view
    @ViewBuilder
    private var userCountStatusView: some View {
        if user.name.count >= 2 {
            HStack{ Spacer()
                Circle()
                    .frame(width: userCountStatusCircleFrameSize , height: userCountStatusCircleFrameSize)
                    .foregroundColor(userCountStatusColor )
                    .overlay(
                        Text( "+\(user.name.count)")
                            .font(.system(size: userNotificationFontSize))
                            .fontWeight(.heavy)
                            .foregroundColor(userCountStatusTextColor )
                    )
                    .background {
                        Circle()
                            .stroke(userOnlineBorderColor, lineWidth: 3)
                    }.offset(x:4, y: 3)
            }.padding(.horizontal, 2.5)
        }
    }
    
    // user online and count vertical stack
    private var userOnlineAndCountStatusStack: some View {
            VStack (alignment: .trailing){
             userOnlineStatusView
             Spacer()
             userCountStatusView
                }
   }
    
   
    // MARK: users name and role stack
    //user name and role vertical stack
    private var personNameAndRoleStack: some View {
        VStack (alignment: .leading, spacing: 2){
          usersNameView(user: user, userNameFontSize: $userNameFontSize, userNameTextColor: $userNameTextColor)
            if user.role != nil {
                usersRoleView(user: user, userRolefontSize: $userRolefontSize, userRoleTextColor: $userRoleTextColor)
            }
            }
    }
    
    
    // MARK: users notification
    // users notification view
    @ViewBuilder
    private var userNotificationView: some View {
        if user.notifications >= 1  {
            Circle()
                .frame(width: userNotificationBackgroundSize , height: userNotificationBackgroundSize)
                .foregroundColor(user.name.count <= 0 ? .clear : userNotificationBackground)
                .overlay(
                    Text( "\(user.notifications)")
                        .font(.system(size: userNotificationFontSize))
                        .fontWeight(.bold)
                        .foregroundColor(user.name.count <= 0 ? .clear :.white)
                )
        }
    }
    
    
    // MARK: person card
    //person card view
    private var personCard: some View {
        HStack (alignment: .center) {
         userProfilePic
         personNameAndRoleStack
            Spacer(minLength: 50)
         
         userNotificationView
        }.padding(15)
   }
    
    
    
}
