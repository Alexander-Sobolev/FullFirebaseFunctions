//
//  AuthenticationView.swift
//  FullFirebaseFunctions
//
//  Created by Alexander Sobolev on 17.03.2023.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
      VStack {
        NavigationLink {
          SignInEmailView()
        } label: {
          Text("Sign IN With Email")
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
      .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        AuthenticationView()
      }
    }
}
