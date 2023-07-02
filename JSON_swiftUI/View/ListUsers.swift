//
//  ListUsers.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 1/07/23.
//

import SwiftUI

struct ListUsers: View {
    
    @StateObject var data = ListUsersViewModel()
    
    var body: some View {
        if data.dataModel.data.isEmpty{
            ProgressView()
        }else{
            List(data.dataModel.data, id: \.id){ item in
                NavigationLink(destination: DetailUser(id: item.id)) {
                    HStack{
                        URLImage(url: URL(string: item.avatar)!)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading){
                            Text(item.first_name).font(.title)
                            Text(item.email).font(.subheadline)
                        }
                    }
                }
            }.navigationBarTitle("JSON con images!")
        }
    }
}

struct URLImage: View {
    let url: URL
    @State private var image: UIImage? = nil
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image(systemName: "person.fill")
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
