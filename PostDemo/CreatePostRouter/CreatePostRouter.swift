//
//  Untitled.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import SwiftUI

struct CreatePostRouter {
  static func createModule() -> some View {
    let interactor = CreatePostInteractor()
    let presenter = CreatePostPresenter(interactor: interactor)
    return CreatePostView(presenter: presenter)
  }
}
