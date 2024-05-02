//
//  FooterView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 1/5/2024.
//

import SwiftUI

struct FooterView: View {
    @State private var selectedIcon: String? = nil
    @State private var isShowingSheet = false
    @State private var showEditWeeklyGoal = false
    @State private var showEditProfile = false
    @State private var isShowingTimer = false
    @State private var isShowingHome = false

    var body: some View {
        NavigationView {
            HStack(spacing: 25) {
                Spacer().frame(width: 30)

                Button(action: {
                    selectedIcon = "person.crop.circle"
                    isShowingSheet = true
                }) {
                    Image(systemName: selectedIcon == "person.crop.circle" ? "person.crop.circle.fill" : "person.crop.circle")
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                }
                .frame(maxWidth: .infinity)

                NavigationLink(destination: JourneyView(), isActive: $isShowingHome) {
                    Button(action: {
                        selectedIcon = "house"
                        isShowingHome = true
                    }) {
                        Image(systemName: selectedIcon == "house" ? "house.fill" : "house")
                            .foregroundColor(.blue)
                            .font(.system(size: 30))
                    }
                    .frame(maxWidth: .infinity)
                }

                NavigationLink(destination: TimerView(), isActive: $isShowingTimer) {
                    Button(action: {
                        selectedIcon = "clock"
                        isShowingTimer = true
                    }) {
                        Image(systemName: selectedIcon == "clock" ? "clock.fill" : "clock")
                            .foregroundColor(.blue)
                            .font(.system(size: 30))
                    }
                    .frame(maxWidth: .infinity)
                }

                Button(action: {
                    selectedIcon = "person.3"
                }) {
                    Image(systemName: selectedIcon == "person.3" ? "person.3.fill" : "person.3")
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    selectedIcon = "cart"
                }) {
                    Image(systemName: selectedIcon == "cart" ? "cart.fill" : "cart")
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                }
                .frame(maxWidth: .infinity)

                Spacer().frame(width: 20)
            }
            .padding(.bottom, 0)
            .background(Color.white)
            .actionSheet(isPresented: $isShowingSheet) {
                ActionSheet(
                    title: Text("Profile"),
                    buttons:[
                        .default(Text("Edit Profile"),
                                     action: editProfile),
                        .default(Text("Edit Weekly Goal"),
                                     action: editGoals),
                        .destructive(Text("Log Out"),
                                     action: logOut),
                        .cancel()
                    ]
                )
            }
            .background(
                NavigationLink(destination: InputHoursView(), isActive: $showEditWeeklyGoal) {
                    EmptyView()
                }
                .hidden()
            )
            .background(
                NavigationLink(destination: ProfileView(), isActive: $showEditProfile) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }

    func editProfile() {
        showEditProfile = true
    }

    func editGoals() {
        // Activate the NavigationLink to navigate to InputHoursView
        showEditWeeklyGoal = true
    }

    func logOut() {
        // Implement the action for logging out
    }
}

//struct JourneyView: View {
//    var body: some View {
//        JourneyView()
//    }
//}
//
//struct TimerView: View {
//    var body: some View {
//        TimerView()
//    }
//}

#if DEBUG
struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
#endif
