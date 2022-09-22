//
//  APICallers.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 18/09/2022.
//

import Foundation
import UIKit

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    func fetch(completion: @escaping (Result<[GameElement], Error>) -> Void)  {
        guard let url = Constants.GameURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let game = try JSONDecoder().decode([GameElement].self, from: data)
                    completion(.success(game))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
     
    func get(completion: @escaping (Result<[PopularGame], Error>) -> Void)  {
        guard let url = Constants.populargameURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let populars = try JSONDecoder().decode([PopularGame].self, from: data)
                    completion(.success(populars))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getTopGames(completion: @escaping (Result<[TopGame], Error>) -> Void)  {
        guard let url = Constants.topGameURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let top = try JSONDecoder().decode([TopGame].self, from: data)
                    completion(.success(top))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
     
     
    
   
}

