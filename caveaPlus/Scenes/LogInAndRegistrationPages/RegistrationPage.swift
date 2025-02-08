//
//  RegistrationPage.swift
//  caveaPlus
//
//  Created by Data on 19.01.25.
//

import SwiftUI

struct RegistrationPage: View {
    @State private var name = ""
    @State private var sureName = ""
    @State private var mobileNumber = ""
    @State private var gMail = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .frame(height: 950)
                .edgesIgnoringSafeArea(.all)
                .background(Color("MainBackgroundColor"))
                .blur(radius: 15)
            ScrollView(showsIndicators: false) {
                VStack {
                    Image("CaveaLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 100)
                        .padding(.top, 20)
                    
                    Text("შემოუერთდი კინოსამყაროს")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                        .padding(.top)
                    
                    HStack(spacing: 16) {
                        InputView(text: $name,
                                  title: "სახელი",
                                  placeholder: "სახელი",
                                  width: 173, spacerWidth: 100)
                        
                        InputView(text: $sureName,
                                  title: "გვარი",
                                  placeholder: "გვარი",
                                  width: 173, spacerWidth: 100)
                    }
                    .padding(.top)
                    
                    InputView(text: $mobileNumber,
                              title: "მობ. ნომერი",
                              placeholder: "მობ. ნომერი",
                              width: 360, spacerWidth: 250)
                    .padding(.top)
                    .keyboardType(.numberPad)
                    .autocapitalization(.none)
                    
                    InputView(text: $gMail,
                              title: "ელ-ფოსტა",
                              placeholder: "ელ-ფოსტა",
                              width: 360, spacerWidth: 255)
                    .padding(.top)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "პაროლი",
                              placeholder: "პაროლი",
                              isSecureField: true, width: 360, spacerWidth: 265)
                    .padding(.top)
                    
                    InputView(text: $confirmPassword,
                              title: "გაიმეორე პაროლი",
                              placeholder: "გაიმეორე პაროლი",
                              isSecureField: true, width: 360, spacerWidth: 180)
                    .padding(.top)
                    
                    Button {
                        print("mushaobs...")
                    } label: {
                        Text("რეგისტრაცია")
                            .padding()
                            .foregroundStyle(.white)
                            .frame(width: 360)
                            .background(LinearGradient(gradient: Gradient(colors: [.left, .middle, .right]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                        
                        
                    }
                    .padding()
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("უკვე გაქვს ანგარიში?")
                            Text("ავტორიზაცია")
                                .bold()
                                .underline()
                        }
                        .foregroundStyle(.gray)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .background(Color("MainBackgroundColor"))
    }
}

#Preview {
    RegistrationPage()
}
