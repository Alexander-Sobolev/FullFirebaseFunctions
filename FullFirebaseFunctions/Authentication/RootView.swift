//
//  RootView.swift
//  FullFirebaseFunctions
//
//  Created by Alexander Sobolev on 18.03.2023.
//

import SwiftUI

struct RootView: View {
  @State private var showSignInView = false
    var body: some View {
      ZStack {
        NavigationStack {
          SettingsView(showSignInView: $showSignInView)
        }
      }
      .onAppear {
        let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
        self.showSignInView = authUser == nil
        print(showSignInView)
      }
      .fullScreenCover(isPresented: $showSignInView) {
        NavigationStack {
          AuthenticationView(showSignInView: $showSignInView)
        }
      }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
