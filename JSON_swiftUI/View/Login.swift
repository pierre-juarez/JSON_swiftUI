//
//  Login.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 19/06/23.
//

import SwiftUI

struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login : LoginViewModel
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea(.all)
            VStack{
                Text("Email").foregroundColor(.white).bold()
                TextField("Email", text: $email)
                    .background(.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                Text("Password").foregroundColor(.white).bold()
                SecureField("Password", text: $password)
                    .background(.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    login.login(email: email, password: password)
                } label: {
                    Text("Ingresar").foregroundColor(.white).bold()
                }
            }.padding(.all)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
