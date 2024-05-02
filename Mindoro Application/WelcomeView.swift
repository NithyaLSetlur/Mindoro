//
//  WelcomeView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 29/4/2024.
//

// WELCOME PAGE

import SwiftUI

struct WelcomeView: View {
    @State private var navigationActive = false  // State variable to control navigation
    
    var body: some View {
        NavigationView{
            NavigationLink(
                destination: InstructionsView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true),
                isActive: $navigationActive,
                label: {
                    ZStack {
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                            .edgesIgnoringSafeArea(.all)
                            .padding(.bottom, -370)
                        
                        VStack {
                            Text("WELCOME TO MINDORO!")
                                .font(.system(size: 50))
                                .multilineTextAlignment(.center)
                                .font(.title)
                                .fontWeight(.black)
                                .padding(.top, -290)
                            Text("Let's conquer those study sessions together! 📚💪")
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(width: 350)
                                .padding(.top, -180)
                            
                        }
                        .padding()
                        .tint(.black)
                    }
                }
            )
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)  
        }
    }
}

#Preview {
    WelcomeView()
}

