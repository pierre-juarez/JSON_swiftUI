//
//  DetailUser.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 2/07/23.
//

import SwiftUI

struct DetailUser: View {
    
    var id: Int
    @StateObject var user = DetailUserViewModel()
    
    var body: some View {
        VStack{
            if user.avatar.isEmpty{
                ProgressView()
            }else{
                URLImage(url: URL(string: user.avatar)!)
                    .frame(width: 130, height: 130)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name).font(.largeTitle)
                Text(user.email).font(.title)
            }
        }.onAppear{
            user.fetch(id: id)
        }
    }
}

