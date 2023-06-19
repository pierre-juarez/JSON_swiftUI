//
//  ContentView.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login : LoginViewModel
    
    var body: some View {
        Group{
            if login.authenticated == 0{
                Login()
            }else if login.authenticated == 1{
                Home()
            }else if login.authenticated == 2{
                VStack{
                    Text("Usuario y/o contraseña incorrecto.")
                    Button {
                        login.authenticated = 0
                    } label: {
                        Text("Regresar")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
