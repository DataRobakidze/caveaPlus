//
//  LogInPage.swift
//  caveaPlus
//
//  Created by Data on 16.01.25.
//

import SwiftUI

struct LogInPage: View {
    @State private var gMail = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 950)
                .edgesIgnoringSafeArea(.all)
                .background(Color("MainBackgroundColor"))
                .blur(radius: 20)
            
            VStack {
                Image("CaveaLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 90)
                    .padding()
                
                Text("განაგრძე ყურება")
                    .bold()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Spacer()
                    .frame(height: 30)
                
                VStack {
                    VStack {
                        HStack {
                            Text("ელ-ფოსტა")
                                .foregroundStyle(.white)
                            Spacer()
                                .frame(width: 255)
                            
                        }
                        TextField("ელ-ფოსტა", text: $gMail)
                            .padding()
                            .frame(width: 360, height: 50)
                            .background(Color("TextFieldColor"))
                            .cornerRadius(25)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            Text("პაროლი")
                                .foregroundStyle(.white)
                            Spacer()
                                .frame(width: 280)
                        }
                        TextField("პაროლი", text: $password)
                            .textContentType(.password)
                            .padding()
                            .frame(width: 360, height: 50)
                            .background(Color("TextFieldColor"))
                            .cornerRadius(25)
                            .autocapitalization(.none)
                        
                        HStack {
                            Spacer()
                                .frame(width: 130)
                            
                            Button {
                                if let url = URL(string: "https://cavea.plus/ka/auth/password/reset") {
                                        UIApplication.shared.open(url)
                                    }
                            } label: {
                                Text("დაგავიწყდა პაროლი ?")
                                    .foregroundStyle(.gray)
                                    .font(.title3)
                            }
                        }
                        .padding()
                    }
                    
                    Button {
                        print("mushaobs")
                    } label: {
                        Text("ავტორიზაცია")
                            .padding()
                            .foregroundStyle(.white)
                            .frame(width: 350)
                            .background(LinearGradient(gradient: Gradient(colors: [.left, .middle, .right]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                        
                    }
                    .padding()
                    
                }
                Spacer()
                    .frame(height: 110)
            }
            .padding()
            
            
        }
    }
}

#Preview {
    LogInPage()
}
