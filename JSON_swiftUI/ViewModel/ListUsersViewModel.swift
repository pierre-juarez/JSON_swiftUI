//
//  ListUsersViewModel.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 1/07/23.
//

import Foundation

class ListUsersViewModel: ObservableObject{
    @Published var dataModel = ListUsersModel(data: [])
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://reqres.in/api/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            
            do{
                let json = try JSONDecoder().decode(ListUsersModel.self, from: data)
                DispatchQueue.main.async {
                    self.dataModel = json
                }
            }catch let error as NSError{
                print("Error al obtener información del endpoint,", error.localizedDescription)
            }
            
        }.resume()
        
    }
}
