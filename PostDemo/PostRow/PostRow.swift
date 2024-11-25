//
//  PostRow.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import SwiftUI

struct PostRow: View {
  @State private var isLiked = false
  @State private var likeCount = Int.random(in: 1...100)
  @State private var viewsCount = Int.random(in: 50...500)
  let post: Post
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(systemName: post.user.profileImage)
          .resizable()
          .frame(width: 40, height: 40)
          .clipShape(Circle())
          .padding(4)
          .background(Color.gray.opacity(0.2))
          .clipShape(Circle())
        VStack(alignment: .leading) {
          Text(post.user.name).font(.headline)
          Text(post.user.username).font(.subheadline).foregroundColor(.gray)
        }
      }
      Text(post.text).font(.body).padding(.top, 5)
      if let image = post.image {
        Image(uiImage: image)
          .resizable()
          .scaledToFill()
          .frame(height: 200)
          .clipped()
          .cornerRadius(10)
      }
      
      // Like, Comment, and Share Buttons
      HStack {
        // Like Button
        Button(action: {
          isLiked.toggle()
          likeCount += isLiked ? 1 : -1
        }) {
          HStack {
            Image(systemName: isLiked ? "heart.fill" : "heart")
              .foregroundColor(isLiked ? .red : .gray)
            Text("\(likeCount)")
              .font(.footnote)
          }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.trailing, 10)
        
        Spacer()
        // Comment Button
        Button(action: {
          // Placeholder for comment functionality
          print("Comment button tapped!")
        }) {
          HStack {
            Image(systemName: "message")
              .foregroundColor(.gray)
            Text("Comment")
              .font(.footnote)
          }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.trailing, 10)
        
        Spacer()
        // Views Count
        HStack {
          Image(systemName: "eye")
            .foregroundColor(.gray)
          Text("\(viewsCount)")
            .font(.caption)
            .foregroundColor(.gray)
        }
        
        Spacer()
        // Share Button
        Button(action: {
          // Placeholder for share functionality
          sharePost(post)
        }) {
          HStack {
            Image(systemName: "square.and.arrow.up")
              .foregroundColor(.gray)
            Text("Share")
              .font(.footnote)
          }
        }
        .buttonStyle(PlainButtonStyle())
      }
      .padding(.top, 8)
    }
    .padding(.vertical, 10)
  }
  
  private func sharePost(_ post: Post) {
          let message = "Check out this post: \(post.text)"
          let activityController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
          if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
              windowScene.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
          }
      }
}
