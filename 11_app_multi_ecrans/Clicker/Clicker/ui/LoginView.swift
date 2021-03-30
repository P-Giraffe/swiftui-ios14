//
//  LoginView.swift
//  Clicker
//
//  Created by Maxime Britto on 17/12/2020.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var userManager:UserManager
    @StateObject var viewModel = LoginViewModel()
    @Binding var shouldDisplayLoginView:Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Clicker")
                .font(.largeTitle)
                .padding(.bottom)
            Text("Nickname")
            TextField("", text: $viewModel.typedUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
            Text("Password")
            SecureField("", text: $viewModel.typedPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
            HStack {
                Spacer()
                Button("Login") {
                    viewModel.submitCredentials() { loginWasAccepted in
                        if loginWasAccepted {
                            shouldDisplayLoginView = false
                        }
                    }
                }
                
                Spacer()
            }
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        .padding()
        .onAppear() {
            viewModel.userManager = userManager
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userManager: UserManager(webservice: RemoteDataManager(webserviceBaseUrl: "")), shouldDisplayLoginView: .constant(false))
    }
}
