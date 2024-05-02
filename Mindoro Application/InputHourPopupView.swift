//
//  InputHourPopupView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 1/5/2024.
//

import SwiftUI

struct InputHourPopupView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                showAlert = true
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Edit Your Weekly Goals"),
                message: Text("Go to Profile --> Edit Profile and set a goal for the week"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct InputHourPopupView_Previews: PreviewProvider {
    static var previews: some View {
        InputHourPopupView()
    }
}
