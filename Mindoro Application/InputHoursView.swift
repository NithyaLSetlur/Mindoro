//
//  InputHoursView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 1/5/2024.
//

import SwiftUI

struct InputHoursView: View {
    @State private var selectedHours = 0
    let hours = Array(0...50)
    @State private var isSaving = false
    @State private var navigateToJourney = false // State to control navigation
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height:40)
                
                Image("InputHours")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.top, -100)
                
                Text("Select Weekly Hours:")
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
                Picker(selection: $selectedHours, label: Text("")) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour) hours")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Text("Goal for the week: \(selectedHours) hours")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .font(.title)
                
                Button(action: {
                    // Perform save action
                    saveSelectedHours()
                    navigateToJourney = true // Set navigation flag to true
                }) {
                    Text("Done")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(.black)
                
                NavigationLink(
                    destination: JourneyView().onAppear {
                        // Pass selected hours to JourneyView
                        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.dismiss(animated: true, completion: nil)
                        JourneyView().updateMaxHeight(newHeight: selectedHours)
                    },
                    isActive: $navigateToJourney,
                    label: { EmptyView() }
                )
            }
            .padding()
        }
        
        func saveSelectedHours() {
            // Perform saving operation here
            // For demonstration purpose, simply print the selected hour
            print("Selected Hours: \(selectedHours)")
        }
    }
}

struct InputHoursView_Previews: PreviewProvider {
    static var previews: some View {
        InputHoursView()
    }
}