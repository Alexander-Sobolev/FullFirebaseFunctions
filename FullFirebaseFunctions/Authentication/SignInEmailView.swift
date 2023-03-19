//
//  SignInEmailView.swift
//  FullFirebaseFunctions
//
//  Created by Alexander Sobolev on 17.03.2023.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  
  func signUp() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found.")
      return
    }
    
        try await AuthenticationManager.shared.createUser(
          email: email,
          password: password
        )
  }
  
  func signIn() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found.")
      return
    }
    
        try await AuthenticationManager.shared.signInUser(
          email: email,
          password: password
        )
  }
}

struct SignInEmailView: View {
  @Binding var showSignInView: Bool
  @StateObject private var viewModel = SignInEmailViewModel()
  
    var body: some View {
      VStack {
        TextField("Email...", text: $viewModel.email)
          .padding()
          .background(Color.gray.opacity(0.4))
          .cornerRadius(10)
          .autocapitalization(.none)
        
        SecureField("Password...", text: $viewModel.password)
          .padding()
          .background(Color.gray.opacity(0.4))
          .cornerRadius(10)
          .keyboardType(.numberPad)
        
        Button {
          Task {
              do {
                try await viewModel.signUp()
                showSignInView = false // если мы войдем в систему и не будет выброса ошибки, ставим false
                return
              } catch {
                print(error)
            }
            
            do {
              try await viewModel.signIn()
              showSignInView = false 
              return
            } catch {
              print(error)
          }
          }
        } label: {
          Text("Sign In")
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
        Spacer()
      }
      .padding()
      .navigationTitle("Sign In With Email")
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        SignInEmailView(showSignInView: .constant(false))
      }
    }
}
