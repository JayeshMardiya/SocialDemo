//
//  UserModel.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import Foundation
import PhotosUI

// User model
struct User: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let username: String
    let profileImage: String
}

// Post model
struct Post: Identifiable {
    let id = UUID()
    let user: User
    let text: String
    let image: UIImage?
}

//// Dummy Users
//let users = [
//    User(name: "Jack", username: "@jack", profileImage: "person"),
//    User(name: "Max", username: "@max", profileImage: "person.fill"),
//    User(name: "Vicky", username: "@vicky", profileImage: "person.2")
//]
