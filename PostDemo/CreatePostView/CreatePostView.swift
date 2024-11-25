//
//  CreatePostView.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
  @ObservedObject var presenter: CreatePostPresenter
  
  var body: some View {
    NavigationView {
      VStack {
        // User Selection Dropdown
        Picker("Select User", selection: $presenter.selectedUser) {
          ForEach(presenter.users, id: \.id) { user in
            Text(user.name).tag(user)
          }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()
        
        // Create Post Button
        NavigationLink(
          destination: presenter.createPostView(),
          label: {
            Text("Create Post")
              .fontWeight(.bold)
              .foregroundColor(.white)
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.blue)
              .cornerRadius(10)
              .padding(.horizontal)
          })
        
        // Post List
        List(presenter.posts.reversed()) { post in
          PostRow(post: post)
        }
        .listStyle(PlainListStyle())
      }
      .navigationTitle("Posts")
      .alert(isPresented: $presenter.showPermissionAlert) {
        Alert(
          title: Text("Permission Denied"),
          message: Text("Please enable photo library access in settings."),
          dismissButton: .default(Text("OK"))
        )
      }
    }
  }
}
