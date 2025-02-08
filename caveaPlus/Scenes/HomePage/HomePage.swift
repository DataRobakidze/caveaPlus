//
//  HomePage.swift
//  caveaPlus
//
//  Created by Data on 17.01.25.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Page !")
                
                NavigationLink{
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
                
            }
        }
       
    }
}

#Preview {
    HomePage()
}
