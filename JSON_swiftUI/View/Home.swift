//
//  Home.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 19/06/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: LoginViewModel
    
    var body: some View {
        NavigationView {
            Text("Welcome!")
                .navigationTitle("JSON View")
                .navigationBarItems(leading: Button(action: {
                    
                }, label: {
                    Text("Next")
                }), trailing: Button(action: {
                    UserDefaults.standard.removeObject(forKey: "session")
                    login.authenticated = 0
                }, label: {
                        Text("Logout")
                }))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
