//
//  SignUpView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 29/4/2024.
//

import SwiftUI

struct SignUpView: View {
    @Environment (\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack{
            Text("Sign Up")
                .font(.largeTitle)
                .padding(.bottom, 10)
                .fontWeight(.black)
            
            ZStack {
                Image("SignUpLogin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 370, height: 550)

                VStack{
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Spacer()
                        .frame(height: 200)
                }
            }
            Button{
                dismiss()
//                signUp()
            } label: {
                Text("Sign Up")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }

//            NavigationLink(
//                destination: LoginView(),
//                label: {
//                    Text("Already have an account? Log In")
//                        .foregroundColor(.blue)
//                }
//            )
        }
        .padding()
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

//    func signUp() {
//        // Perform sign-up logic here (e.g., validate input and create new account)
//        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
//            alertMessage = "Please fill in all fields"
//        } else if password != confirmPassword {
//            alertMessage = "Passwords do not match"
//        } else {
//            // Successful sign-up
//            alertMessage = "Sign up successful!"
//            // You can implement further logic here (e.g., store the new user's credentials)
//        }
//        isShowingAlert = true
//    }
}

#Preview {
    SignUpView()
}
