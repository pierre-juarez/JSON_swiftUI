//
//  UsersViewModel.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 30/06/23.
//

import Foundation

class UsersViewModel: ObservableObject{
    
    @Published var dataModel: [UsersModel] = []
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            
            do{
                let json = try JSONDecoder().decode([UsersModel].self, from: data)
                DispatchQueue.main.async {
                    self.dataModel = json
                }
            }catch let error as NSError{
                print("Error al obtener información del endpoint,", error.localizedDescription)
            }
            
        }.resume()
        
    }

    
}
