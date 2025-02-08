//
//  InputView.swift
//  caveaPlus
//
//  Created by Data on 19.01.25.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var width: CGFloat
    var spacerWidth: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.white)
                Spacer()
                    .frame(width: spacerWidth)
                
            }
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .textContentType(.password)
                    .padding()
                    .frame(width: width, height: 50)
                    .background(Color("TextFieldColor"))
                    .cornerRadius(25)
                    .opacity(0.7)
            }else {
                TextField(placeholder, text: $text)
                    .padding()
                    .frame(width: width, height: 50)
                    .background(Color("TextFieldColor"))
                    .cornerRadius(25)
                    .opacity(0.7)
            }
            
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "email", placeholder: "dddd", width: 360, spacerWidth: 255)
}
