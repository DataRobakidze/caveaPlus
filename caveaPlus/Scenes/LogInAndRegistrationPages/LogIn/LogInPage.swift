//
//  LogInPage.swift
//  caveaPlus
//
//  Created by Data on 16.01.25.
//

import SwiftUI

struct LogInPage: View {
    @StateObject private var viewModel = LogInViewModel()

    var body: some View {
        NavigationStack{
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 15)
                
                VStack {
                    // Logo and Title
                    logoAndTitle
                    
                    // Input Fields
                    InputView(text: $viewModel.gMail,
                              title: "ელ-ფოსტა",
                              placeholder: "ელ-ფოსტა", width: 360, spacerWidth: 255)
                        .padding()
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    InputView(text: $viewModel.password,
                              title: "პაროლი",
                              placeholder: "პაროლი",
                              isSecureField: true, width: 360, spacerWidth: 255)
                        .padding()

                    // Forgot Password Button
                    forgotPasswordButton
                    
                    // Login Button
                    loginButton
                    
                    // Error Message
                    if let errorMessage = viewModel.loginErrorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    // Registration Link
                    NavigationLink {
                        RegistrationPage()
                            .navigationBarHidden(true)
                    } label: {
                        HStack(spacing: 3) {
                            Text("არ გაქვს ანგარიში? გაიარე")
                            Text("რეგისტრაცია")
                                .bold()
                                .underline()
                        }
                        .foregroundStyle(.gray)
                    }
                    .padding(.top, 100)
                }
                .padding()
            }
            .background(Color("MainBackgroundColor"))
            
            // NavigationLink to ContentView when logged in
            NavigationLink(destination: ContentView(), isActive: $viewModel.isLoggedIn) {
                EmptyView()
            }
        }
    }

    // MARK: - Logo and Title
    private var logoAndTitle: some View {
        VStack {
            Image("CaveaLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
                .padding(.top, 20)
            
            Text("განაგრძე ყურება")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding(.top, 20)
        }
    }

    // MARK: - Forgot Password Button
    private var forgotPasswordButton: some View {
        HStack {
            Spacer().frame(width: 130)
            Button {
                if let url = URL(string: "https://cavea.plus/ka/auth/password/reset") {
                    UIApplication.shared.open(url)
                }
            } label: {
                Text("დაგავიწყდა პაროლი ?")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
            }
        }
        .padding(.top)
    }

    // MARK: - Login Button
    private var loginButton: some View {
        Button {
            viewModel.authenticateUser()
        } label: {
            if viewModel.isLoading {
                ProgressView()
                    .foregroundColor(.white)
            } else {
                Text("ავტორიზაცია")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(width: 360)
                    .background(LinearGradient(gradient: Gradient(colors: [.left, .middle, .right]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
            }
        }
        .padding()
    }
}

#Preview {
    LogInPage()
}
