//
//  InstructionsView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 29/4/2024.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        NavigationView{
            NavigationLink{
                LoginView()
            } label: {
                VStack {
                    Text("Instructions")
                        .font(.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30) // Adjust as needed
                    
                    HStack {
                        // Image on the left
                        Image("InstructionImage")
                            .resizable()
                        //                    .scaledToFit()
                            .frame(width: 200, height: 700) // Adjust size as needed
                            .padding(.bottom, -50)
                        
                        
                        // Text on the right
                        VStack(alignment: .leading) {
                            //                    Spacer().frame(height:50)
                            Text("01. Create an Account")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                            Spacer().frame(height:70)
                            Text("02. Set a Goal for the Week in the Profile Menu")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                            Spacer().frame(height:70)
                            Text("03. Use our Pomodoro Clock to Study")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                            Spacer().frame(height:40)
                            Text("04. Look through your progress in the Journey")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                            Spacer().frame(height:40)
                            Text("05. Collect Minions to enlarge your Minion Family")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                            Spacer().frame(height:50)
                        }
                        .foregroundColor(.black) // You can adjust the text color here
                        .padding(.trailing, 20) // Adjust as needed
                    }
                    .padding(.horizontal, 20) // Adjust horizontal padding as needed
                }
            }
            .tint(.black)
        }
    }
}

#Preview {
    InstructionsView()
}
