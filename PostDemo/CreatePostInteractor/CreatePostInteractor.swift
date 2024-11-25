//
//  CreatePostInteractor.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import Photos
import PhotosUI

class CreatePostInteractor {
  var users: [User] = [
    User(name: "Jack", username: "@jack", profileImage: "person"),
    User(name: "Max", username: "@max", profileImage: "person.fill"),
    User(name: "Vicky", username: "@vicky", profileImage: "person.2")
  ]
  
  func createPost(user: User, text: String, image: UIImage?) -> Post {
    return Post(user: user, text: text, image: image)
  }
  
  func checkPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
    let status = PHPhotoLibrary.authorizationStatus()
    
    switch status {
    case .authorized, .limited:
      completion(true)
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization { newStatus in
        DispatchQueue.main.async {
          completion(newStatus == .authorized || newStatus == .limited)
        }
      }
    case .denied, .restricted:
      completion(false)
    @unknown default:
      completion(false)
    }
  }
}
