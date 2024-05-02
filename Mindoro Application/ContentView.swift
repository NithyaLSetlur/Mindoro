//
//  ContentView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 29/4/2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    let pages: [AnyView] = [
        AnyView(LoadingView()),
        AnyView(WelcomeView()),
        AnyView(InstructionsView()),
        AnyView(LoginView())
    ]

    var body: some View {
        NavigationStack {
            LoadingView()
        }
    }
}

//class HoursManager: ObservableObject {
//    @Published var selectedHours: Int = 0
//}


#Preview {
    ContentView()
}
