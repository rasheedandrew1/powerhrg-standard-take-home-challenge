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
         @State var userProfilePicSize : CGFloat = Image.MyTheme.imageSize.imageSize1

// state properties for user profile online status
@State var userOnlineColor : Color = Color.MyTheme.statusColors.Success
@State var userOnlineBorderColor : Color = Color.MyTheme.borderColors.Border
@State var userOnlineCircleFrameSize : CGFloat = Circle.MyTheme.Circle1
@State var userOnlineCircleBackgroundBorderWidth: CGFloat = Circle.MyTheme.lineWidth3

// state properties for user count status
@State var userCountStatusColor : Color = Color.MyTheme.statusColors.subtleVariationColors.SuccessSubtle
@State var userCountStatusTextColor : Color = Color.MyTheme.actionColors.Actions
@State var userCountStatusTextFontWeight : Font.Weight = Font.Weight.MyTheme.heavyFont
@State var userCountStatusBorderColor : Color = Color.MyTheme.borderColors.Border
@State var userCountStatusBackgroundBorderWidth: CGFloat = Circle.MyTheme.lineWidth3
@State var userCountStatusCircleFrameSize : CGFloat = Circle.MyTheme.Circle2

// state properties for users name
@State var userNameFontSize : CGFloat = Font.MyTheme.FontSize4
        @State var userNameTextColor : Color = Color.MyTheme.TextColors.TextColorsDefalut
@State var userNameFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont

// state properties for user role
@State var userRolefontSize : CGFloat = Font.MyTheme.FontSize2
@State var userRoleTextColor : Color = Color.MyTheme.TextColors.TextColorsDefalut
@State var userRoleFontWeight : Font.Weight = Font.Weight.MyTheme.regularFont
        
// state properties for user notifications
@State var userNotificationFontSize : CGFloat = Font.MyTheme.FontSize1
@State var userNotificationFontWeight : Font.Weight = Font.Weight.MyTheme.boldFont
@State var userNotificationBackgroundSize : CGFloat = Circle.MyTheme.Circle3
@State var userNotificationBackgroundColor : Color = Color.MyTheme.actionColors.Actions
@State var zeroUserNotificationBackgroundColor : Color = Color.MyTheme.otherColors.clear
@State var zeroNotificationTextColor : Color = Color.MyTheme.otherColors.clear
@State var someNotificationTextColor : Color = Color.MyTheme.otherColors.white

var body: some View {
        personCard
        .environmentObject(usersListViewModel)
    }
}

    // MARK: - preview
     struct peopleSectionCardView_Previews: PreviewProvider {
    static var someUser = person(name: ["joe Biden", "Kamala Harris",], role: "president & Vice president", profilePic: "liberty", active: true, notifications: 5)
    
    static var previews: some View {
        peopleSectionCardView(user: someUser)
        .environmentObject(usersListViewModel())
        .previewLayout(.sizeThatFits)
    }
    }

    // MARK: - extension
    extension peopleSectionCardView {
   
    // MARK: - users name structure
    struct usersNameView: View {
        let user: person
        @Binding var userNameFontSize : CGFloat
        @Binding var userNameTextColor : Color
        @Binding var userNameFontWeight : Font.Weight
        
        var body: some View {
            HStack{
                ForEach(user.name.indices,  id: \.self) { item in
                    Text(user.name[item])
                        .font(.system(size: userNameFontSize))
                                 .fontWeight(userNameFontWeight)
                                 .foregroundColor(userNameTextColor)
                                 .lineLimit(1)
                }
             }
         }
    }
  
    
    // MARK: - users role structure
    struct usersRoleView: View {
        let user: person
        @Binding var userRolefontSize : CGFloat
        @Binding var userRoleTextColor : Color
        @Binding var userRoleFontWeight : Font.Weight
        
        var body: some View {
            Text(user.role ?? "")
                .font(.system(size: userRolefontSize))
                         .fontWeight(userRoleFontWeight)
                         .foregroundColor(userRoleTextColor )
        }

    }
    
    
    // MARK: - users profile pic, online status and count variables
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
                    .stroke(userCountStatusBorderColor, lineWidth: userOnlineCircleBackgroundBorderWidth)
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
                            .fontWeight(userCountStatusTextFontWeight)
                            .foregroundColor(userCountStatusTextColor )
                    )
                    .background {
                        Circle()
                            .stroke(userOnlineBorderColor, lineWidth: userCountStatusBackgroundBorderWidth)
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
    
   
    // MARK: - users name and role stack
    //user name and role vertical stack
    private var personNameAndRoleStack: some View {
        VStack (alignment: .leading, spacing: 2){
            usersNameView(user: user, userNameFontSize: $userNameFontSize, userNameTextColor: $userNameTextColor, userNameFontWeight: $userNameFontWeight)
            if user.role != nil {
                usersRoleView(user: user, userRolefontSize: $userRolefontSize, userRoleTextColor: $userRoleTextColor, userRoleFontWeight: $userRoleFontWeight)
            }
            }
    }
    
    
    // MARK: - users notification
    // users notification view
    @ViewBuilder
    private var userNotificationView: some View {
        if user.notifications >= 1  {
            Circle()
                .frame(width: userNotificationBackgroundSize , height: userNotificationBackgroundSize)
                .foregroundColor(user.name.count <= 0 ? zeroUserNotificationBackgroundColor : userNotificationBackgroundColor)
                .overlay(
                    Text( "\(user.notifications)")
                        .font(.system(size: userNotificationFontSize))
                        .fontWeight(userNotificationFontWeight)
                        .foregroundColor(user.name.count <= 0 ? zeroNotificationTextColor :someNotificationTextColor)
                )
        }
    }
    
    
    // MARK: - person card
    //person card view
    private var personCard: some View {
        HStack (alignment: .center) {
         userProfilePic
         personNameAndRoleStack
            Spacer(minLength: 50)
         
         userNotificationView
        }.padding(Spacer.myTheme.large)
   }
    
    
    
}
