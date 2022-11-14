//
//  extensions.swift
//  powerhrg standard take home challenge
//
//  Created by rasheed andrew on 11/13/22.
//

import Foundation
import SwiftUI

extension Color {
    struct MyTheme {
       
       // MARK: - Text colors
        struct TextColors {
            static var TextColorsDefalut: Color {
                return Color("TextColorsDefalut")
            }
            
            static var TextColorsLight: Color {
                return Color("TextColorsLight")
            }
            
            static var TextColorsLighter: Color {
                return Color("TextColorsLighter")
            }
            
        }
        
        // MARK: - background colors
        struct backgroundColors {
            static var Bg: Color {
                return Color("Bg")
            }
        }
        
        // MARK: - card colors
        struct cardColors {
            static var Cards: Color {
                return Color("Cards")
            }
        }
        
        // MARK: - status colors
        struct statusColors {
            static var Success: Color {
                return Color("Success")
            }
           
            static var Warning: Color {
                return Color("Warning")
            }
            
            static var Error: Color {
                return Color("Error")
            }
            
            static var Info: Color {
                return Color("Info")
            }
            
            static var Neutral: Color {
                return Color("Neutral")
            }
            
            struct subtleVariationColors {
                static var SuccessSubtle: Color {
                    return Color("SuccessSubtle")
                }
                
               static var WarningSubtle: Color {
                    return Color("WarningSubtle")
                }
                
                static var errorSubtle: Color {
                     return Color("errorSubtle")
                 }
                
                static var InfoSubtle: Color {
                    return Color("InfoSubtle")
                }
                
               static var NeutralSubtle: Color {
                    return Color("NeutralSubtle")
                }
                
            }
            
         }
        
        // MARK: - data colors
        struct dataColors {
            static var Data1: Color {
                return Color("Data1")
            }
            
            static var Data2: Color {
                return Color("Data2")
            }
            
            static var Data3: Color {
                return Color("Data3")
            }
            
            static var Data4: Color {
                return Color("Data4")
            }
            
            static var Data5: Color {
                return Color("Data5")
            }
            
            static var Data6: Color {
                return Color("Data6")
            }
            
            static var Data7: Color {
                return Color("Data7")
            }
            
            static var Data8: Color {
                return Color("Data8")
            }
        }
        
        // MARK: - action colors
        struct actionColors {
            static var Actions: Color {
                return Color("Actions")
            }
        }
        
        // MARK: - active colors
        struct activeColors {
            static var Active: Color {
                return Color("Active")
            }
        }
        
        // MARK: - border colors
        struct borderColors {
            static var Border: Color {
                return Color("Border")
            }
        }
        
        // MARK: - shadow colors
        struct shadowColors {
            static var Shadow: Color {
                return Color("Shadow")
            }
        }
      
        // MARK: - product colors
        struct productColors {
            
            static var Windows: Color {
                return Color("Windows")
            }
             static var Siding: Color {
                return Color("Siding")
            }
            static var Doors: Color {
                return Color("Doors")
            }
            static var Solar: Color {
                return Color("Solar")
            }
            static var Roofing: Color {
                return Color("Roofing")
            }
            static var gutters: Color {
                return Color("gutters")
            }
            static var AtticInsulation: Color {
                return Color("AtticInsulation")
            }
            
            
        }
        
        // MARK: - other colors
        struct otherColors {
            static var primary: Color {
                return Color("primary")
            }
            
            static var black: Color {
                return Color(.black)
            }
            
            static var white: Color {
                return Color(.white)
            }
            
            static var clear: Color {
                return Color(.clear)
            }
            
            static var gray: Color {
                return Color(.gray)
            }
        }
        
       
        // MARK: - opacity extensions
        static var opacity1: Double {
            return 0.1
        }
    }
}

extension Spacer {
    struct myTheme {
        // MARK: - spacing
        static var small: Double {
            return 5.0
        }
        
        static var medium: Double {
            return 10.0
        }
        
        static var large: Double {
            return 15.0
        }
        
        static var xLarge: Double {
            return 20.0
        }
        
        static var xxLarge: Double {
            return 25.0
        }
    }
}

extension Image {
    struct MyTheme {
        
        // MARK: - image extensions
        struct images {
            static var liberty: Image {
                return Image("liberty")
            }
            
            static var r1: Image {
                return Image("r1")
            }
            
            static var r2: Image {
                return Image("r2")
            }
            
            static var r3: Image {
                return Image("r3")
            }
            
            static var r4: Image {
                return Image("r4")
            }
            
            static var r5: Image {
                return Image("r5")
            }
            
            static var r6: Image {
                return Image("r6")
            }
            
            static var r7: Image {
                return Image("r7")
            }
            
            static var u1: Image {
                return Image("u1")
            }
            
            static var u2: Image {
                return Image("u2")
            }
            
            static var u3: Image {
                return Image("u3")
            }
            
            static var u4: Image {
                return Image("u4")
            }
            
            static var u5: Image {
                return Image("u5")
            }
            
            static var u6: Image {
                return Image("u6")
            }
            
            static var u7: Image {
                return Image("u7")
            }
            
            static var u8: Image {
                return Image("u8")
            }
        }
         
        // MARK: - icon extensions
        struct Icons {
            // MARK: - icon extensions
            static var profileButtonIcon: String{
                return "person.crop.circle"
            }
            
            static var navBarEditButtonIcon: String{
                return  "square.and.pencil"
            }
            
            static var sectionOpenButtonIcon: String{
                return  "chevron.down"
            }
            
            static var sectionCloseButtonIcon: String{
                return  "chevron.up"
            }
            
            static var  nextButtonIcon: String{
                return   "chevron.right"
            }
            
            
            static var leaveRoomButtonIcon: String{
                return  "square.and.arrow.up"
            }
        }

        // MARK: - image size extensions
        struct imageSize {
            // MARK: - image size extensions
            static var imageSize1: CGFloat {
                return 40
            }
            
            static var imageSize2: CGFloat {
                return 100
            }
        }
        
        // MARK: - icon size extensions
        struct iconSize {
            // MARK: - icon size extensions
            static var iconSize1: CGFloat {
                return 14
            }
        }
    }
}

extension Font {

    struct MyTheme {
        // MARK: - font size extensions
        static var FontSize1: CGFloat {
            return 10
        }
        
        static var FontSize2: CGFloat {
            return 12
        }
        
        static var FontSize3: CGFloat {
            return 14
        }
        
        static var FontSize4: CGFloat {
            return 15
        }
        
        static var FontSize5: CGFloat {
            return 16
        }
    }
    
}

extension Font.Weight {

    struct MyTheme {
        // MARK: - font weight extensions
        static var regularFont: Font.Weight {
            return .regular
        }
        
        static var semiBoldFont: Font.Weight {
            return .semibold
        }
        
        static var boldFont: Font.Weight {
            return .bold
        }
        
        static var heavyFont: Font.Weight {
            return .heavy
        }
    }
}

extension Circle {

 struct MyTheme {
     
     // MARK: - circle size extensions
     static var Circle1: CGFloat {
         return 8
     }
     
     static var Circle2: CGFloat {
         return 18
     }
     
     static var Circle3: CGFloat {
         return 20
     }
     
     // MARK: - circle border width extensions
     static var lineWidth1: CGFloat {
         return 0.5
     }
     
     static var lineWidth2: CGFloat {
         return 1.0
     }
     
     static var lineWidth3: CGFloat {
         return 3.0
     }
 }
 
}

extension Rectangle {

 struct MyTheme {
     
     // MARK: - rectangle border width extensions
     static var lineWidth1: CGFloat {
         return 0.5
     }
     
     // MARK: - rectangle corner radius
     struct cornerRadius {
         static var small: CGFloat {
             return 5
         }
         
         static var medium: CGFloat {
             return 10
         }
         
         static var large: CGFloat {
             return 15
         }
         
         static var xLarge: CGFloat {
             return 20
         }
     }
 }
 
}

extension Text {
    
    // MARK: - messages extensions
    struct MyMessage {
        static var NoEvents: String {
            return "There are no events at the moment. \n please check back later."
        }
        
        static var NoMembers: String {
            return "There are no members \n in this room \n at the moment!!!"
        }

    }
}

extension Bool {
    struct MyTheme {
        
        // MARK: - view state extensions
        static var negative: Bool {
            return false
        }
        
        static var positive: Bool {
            return true
        }

    }
}

