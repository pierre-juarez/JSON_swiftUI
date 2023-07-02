//
//  Home.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 19/06/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: LoginViewModel
    @StateObject var users = UsersViewModel()
    
    var body: some View {
        NavigationView {
            if users.dataModel.isEmpty{
                ProgressView()
            }else{
                List(users.dataModel, id: \.id){ item in
                    VStack(alignment: .leading){
                        Text("\(item.username) - \(item.name)")
                        Text(item.email)
                    }
                } .navigationBarTitle("JSON View")
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
}

