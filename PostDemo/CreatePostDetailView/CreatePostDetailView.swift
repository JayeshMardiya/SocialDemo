//
//  Untitled.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import SwiftUI

struct CreatePostDetailView: View {
  @ObservedObject var presenter: CreatePostPresenter
  @Environment(\.presentationMode) var presentationMode
  
  @State private var postText = ""
  @State private var selectedImage: UIImage? = nil
  @State private var showImagePicker = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Create Post")
        .font(.largeTitle)
        .bold()
      
      TextField("What's on your mind?", text: $postText)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      Button(action: {
        presenter.checkPhotoPermission { granted in
          if granted {
            showImagePicker = true
          }
        }
      }) {
        HStack {
          Text("Select Image")
          Spacer()
          if selectedImage != nil {
            Text("✓").foregroundColor(.green)
          }
        }
      }
      .padding()
      .background(Color.gray.opacity(0.2))
      .cornerRadius(10)
      
      if let image = selectedImage {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
          .frame(height: 200)
          .cornerRadius(10)
      }
      
      Button(action: {
        presenter.addPost(text: postText, image: selectedImage)
        presentationMode.wrappedValue.dismiss() // Dismiss the view after submission
      }) {
        Text("Submit")
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
      }
      .padding(.top)
      
      Spacer()
    }
    .padding()
    .sheet(isPresented: $showImagePicker) {
      ImagePicker(image: $selectedImage)
    }
  }
}
