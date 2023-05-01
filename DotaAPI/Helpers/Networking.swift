//
//  Networking.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 1.05.2023.
//

import Foundation

enum NetworkingError: Error {
    case invalidDataError
    case invalidResponseError
    case urlError
    case decodingError(_ error: Error)
}

typealias Handler = (Result <[HeroModel], NetworkingError>) -> Void

class Networking {
    
    static let shared = Networking()
    
    private init() {
        
    }
    
    func fetchHeroes(completion: @escaping Handler) {
        guard let url = URL(string: Constants.API.url) else {
            completion(.failure(.urlError))
            return
        }
        
        //MARK: BACKGROUND TASK
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.invalidDataError))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponseError))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let heroes = try decoder.decode([HeroModel].self, from: data)
                completion(.success(heroes))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                print("Data corrupted")
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                print("Key not found")
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                print("Value not found")
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                print("Type mismatch")
            } catch {
                print("error: ", error)
                print("dümdüz error")
            }
            
        }.resume()
    }
    
}
