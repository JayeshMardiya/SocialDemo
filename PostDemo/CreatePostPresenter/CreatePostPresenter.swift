//
//  CreatePostPresenter.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import SwiftUI

class CreatePostPresenter: ObservableObject {
  private let interactor: CreatePostInteractor
  @Published var posts: [Post] = []
  @Published var users: [User]
  @Published var selectedUser: User
  @Published var showPermissionAlert = false
  
  init(interactor: CreatePostInteractor) {
    self.interactor = interactor
    self.users = interactor.users
    self.selectedUser = interactor.users.first ?? User(name: "", username: "", profileImage: "")
  }
  
  func createPostView() -> some View {
    CreatePostDetailView(presenter: self)
  }
  
  func addPost(text: String, image: UIImage?) {
    let newPost = interactor.createPost(user: selectedUser, text: text, image: image)
    posts.append(newPost)
  }
  
  func checkPhotoPermission(completion: @escaping (Bool) -> Void) {
    interactor.checkPhotoLibraryPermission { granted in
      DispatchQueue.main.async {
        if !granted {
          self.showPermissionAlert = true
        }
        completion(granted)
      }
    }
  }
}
