//
//  SettingsView.swift
//  FullFirebaseFunctions
//
//  Created by Alexander Sobolev on 18.03.2023.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
  
  func signOut() throws {
    try AuthenticationManager.shared.signOut()
  }
}

struct SettingsView: View {
  @StateObject var viewModel = SettingsViewModel()
  @Binding var showSignInView: Bool
  
    var body: some View {
      List {
        Button("Log out") {
          Task {
            do {
              try viewModel.signOut()
              showSignInView = true
            } catch {
              print(error) // Тут не про обработку ошибок поэтому оставлю так
            }
          }
        }
      }
      .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        SettingsView(showSignInView: .constant(false))
      }
    }
}
