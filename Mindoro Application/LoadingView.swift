//
//  LoadingView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 29/4/2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var downloadAmount = 0.0
    @State private var isDownloadComplete = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var onDownloadComplete: (() -> Void)? = nil
    @State private var navigationActive = false  // State variable to control navigation

    var body: some View {
        NavigationView {
            NavigationLink(
                destination: WelcomeView()
                    .navigationBarBackButtonHidden(true)  // Hide back button on the WelcomeView
                    .navigationBarHidden(true),  // Hide navigation bar on the WelcomeView
                isActive: $navigationActive,
                label: {
                    VStack {
                        Image("Mindoro Title")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 310)
                        
                        Image("Mindoro Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 355)
                        
                        Group {
                            if !isDownloadComplete {
                                ProgressView("", value: downloadAmount, total: 100)
                                    .onReceive(timer) { _ in
                                        if downloadAmount < 100 {
                                            downloadAmount += 2
                                        } else {
                                            isDownloadComplete = true
                                            navigationActive = true  // Trigger navigation to WelcomeView
                                        }
                                    }
                                    .frame(width: 310)
                            }
                        }
                    }
                }
            )
            .navigationBarBackButtonHidden(true)  // Hide back button in the LoadingView
            .navigationBarHidden(true)  // Hide navigation bar in the LoadingView
        }
    }
}


#Preview {
    NavigationStack {
        LoadingView()
    }
}
