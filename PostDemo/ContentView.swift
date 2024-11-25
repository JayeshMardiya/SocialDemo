//
//  ContentView.swift
//  PostDemo
//
//  Created by InventionHill on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      CreatePostRouter.createModule()
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
