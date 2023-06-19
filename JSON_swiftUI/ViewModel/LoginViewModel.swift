//
//  LoginViewModel.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 19/06/23.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var authenticated = 0
    
    func login(email: String, password: String){
        
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let params = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response{
                print("response", response)
            }
            
            guard let data = data else { return }
            
            do{
                let datos = try JSONDecoder().decode(LoginModel.self, from: data)
                if !datos.token.isEmpty{
                    DispatchQueue.main.async {
                        self.authenticated = 1
                        print("Token devuelto: \(datos.token)")
                    }
                }
            }catch let error as NSError{
                print("Error al leer los datos: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
        }.resume()
        
    }
    
}
