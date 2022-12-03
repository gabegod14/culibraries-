//
//  NetworkManager.swift
//  culibraries
//
//  Created by Gabriel Godoy on 12/1/22.
//

import Alamofire
import Foundation

class NetworkManager{
    
    static let host = "http://35.192.5.225/api/library/"
    
    static func getMap(libraryId: Int, completion: @escaping (String) -> Void) {
        let endpoint = "\(host)\(libraryId)/maps/"
        
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let userResponse = try? jsonDecoder.decode(String.self, from: data) {
//                    completion(userResponse)
                print("***")
                print(String(decoding: data, as: UTF8.self))
                        completion(String(decoding: data, as: UTF8.self))
//                } else {
//                    print("Failed to get library image")
//                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func getLibraries(completion: @escaping ([Library]) -> Void) {
        let endpoint = host

        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                print("I succeded")
                print(data)
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Library].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to get libraries")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
