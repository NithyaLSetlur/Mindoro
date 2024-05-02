//
//  LoginView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 29/4/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment (\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""
    var name = "Peter"
    
    var body: some View {
        
        VStack{
            Text("Log In")
                .font(.largeTitle)
                .padding(.bottom, 10)
                .fontWeight(.black)
            
            ZStack{
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
                    
                    Spacer()
                        .frame(height: 200)
                    
                }
            }
            
            NavigationLink{
                JourneyView(/*name: name*/)
                //                  signIn()
            } label: {
                Text("Log In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            
            NavigationLink(
                destination: SignUpView(),
                label: {
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.blue)
                }
            )
            Spacer()
                .frame(height: 30)
            
        }
        
        
        .padding()
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Sign In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}


#Preview {
    NavigationStack{
        LoginView()
    }
}

//LoginView()
//    .padding()
//    .sheet(isPresented: $showSignUp) {
//        SignUpView() }

//    func signIn() {
//        // Perform sign-in logic here (e.g., validate credentials)
//        if email == "user@example.com" && password == "password" {
//            // Successful sign-in
//            alertMessage = "Sign in successful!"
//        } else {
//            // Failed sign-in
//            alertMessage = "Invalid email or password"
//        }
//        isShowingAlert = true
//    }
