//
//  ProfileView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 1/5/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var profileImage: Image? = nil
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            // Profile icon section
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 150, height: 150)
                    
                    if let image = profileImage {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .onTapGesture {
                    // Action to open image picker when profile icon tapped
                    showImagePicker = true
                }
                
                Button(action: {
                    // Action to open image picker when button tapped
                    showImagePicker = true
                }) {
                    Text("Change Profile Picture")
                        .foregroundColor(.blue)
                        .padding()                }
                .padding(.bottom)
            }
            
            // Change username section
            Text("Change Username")
                .font(.title2)
            
            TextField("New Username", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Change password section
            Text("Change Password")
                .font(.title2)
                .padding(.top, 40)
            
            SecureField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()
            
            // Save changes button
            Button(action: {
                // Perform action to update username and password here
                // For demonstration purpose, just print the new credentials
                print("New Username: \(newUsername)")
                print("New Password: \(newPassword)")
                
                // Optionally, you can clear the text fields after saving
                newUsername = ""
                newPassword = ""
            }) {
                Text("Save Changes")
                    .foregroundColor(.blue)
                    .padding()
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            // Present image picker when showImagePicker is true
            ImagePickerView(selectedImage: $profileImage)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
            ProfileView()
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView

        init(parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

