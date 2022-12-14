# powerhrg standard

> Showcasing my experience and knowledge on building efficient reusable components.

---

### Table of Contents

- [Description](#description)
- [How To Use](#how-to-use)
- [License](#license)
- [Author Info](#author-info)


---

## Description

"This is a basic three View application. First View (UsersListView) shows three sections; events, rooms and people. All of the sections are interactive
but only the room section navigates to the second view (DrillDownSettingsView) by tapping on a room card from the room section. Events section is empty 
so it shows a message when tapped. Rooms section shows a list of rooms as a card. The room cards all have a picture for the room, room names which are 
bold if the room is active and the number of members in the room in a blue badge if the member count is greater than 1. People section shows a list of
people as a card. The people's card has a profile picture. on the profile picture, there is a green dot to show if the person is online. there is also 
a badge that shows the amount of people in case it was a group of people. To the right of the profile picture is a vertical stack that shows the person
or people's names and their role. In any case that the preson has not been assigned a role, The stack only shows a persons name. To the right of the card 
is a badge that shows unread notifications for the people or person. opening any section also closes out other section to improve users focus on a 
single section at a time. Upon navigating to the DrillDownSettingView, the details of the rooms are provided (cover art, room name, topic, 
descriptiopn and members). There are three buttons, Notification preferences, Members and leave room. Notification preferences is inactive. The members
button navigates you to a roomMembersView (a view with a list of members in the room) and the leave room button navigates the user to the previous room
(usersListView).  Upon navigating to the membersListView, the members of the rooom are presented in a persons card just like it is also presented under 
the people section in the usersListView. The card presents the same information. The navigation bar has a button to return to the previous page, The 
room name and to the right is a badge with the room members count. within the project are 9 files. extensions (a list of extensions to make projet 
editing easy. the userListView file (first view that appears when the app is launched). DrillDownSettingsView (shows the rooms in details). 
peopleSectionCardView file (structure for the people card). roomSectionCardView file (structure for the room card). room file (file for the room model).
person file (file for the person model). userListViewModel File (view model for the userListView where all the data is stored and fetched from upon 
initilization). The assets folder contains all the images and colors used.

![image](https://user-images.githubusercontent.com/60068628/207644331-d972cef8-8494-4f17-8579-d27a6ca9360c.png)

![image](https://user-images.githubusercontent.com/60068628/207644452-ffa63e97-bf45-4685-adec-bd6a58468201.png)

![image](https://user-images.githubusercontent.com/60068628/207644506-a20cdd60-9195-41bf-b2ef-0bb7798df692.png)

![image](https://user-images.githubusercontent.com/60068628/207644575-b835da40-8d71-4950-9125-12d7f93f6f54.png)





#### Technologies

- swiftUI
- swift

---

## How To Use

#### Installation
tap on the code button and open with xcode. clone the project. when xcode opens, run the project on the simulator. The application should build and 
there should be no problems. 



## License

MIT License

Copyright (c) [2022] [Rasheed O Andrew]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[Back To The Top](#powerhrg-standard-take-home-challenge)

---

## Author Info

- E-Mail - rasheedandrew1@gmail.com


[Back To The Top](#powerhrg-standard-take-home-challenge)
