//
//  NetworkManager.swift
//  RestCountries
//
//  Created by anna.zubakina on 15/11/2023.
//

import Foundation

class NetworkManager{
    static func fetchData(url:String,completion: @escaping ([Country]) -> ()){
        
        guard let url = URL(string:url) else {return}
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request){
            (data,response,err) in
            guard err == nil else{
                print("Error fetching data: \(err!)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return}
            
            do{
                let json = try JSONDecoder().decode([Country].self, from:data)
                completion(json)
            }
            catch{
                print("Error decoding JSON: \(error)")
                return
            }
        }.resume()
        
        
    }
}
