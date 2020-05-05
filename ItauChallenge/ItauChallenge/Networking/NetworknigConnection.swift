//
//  NetworknigConnection.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation

protocol Service {
    func fetchTransaction(completion: @escaping ([TransactionListResponse]?, Error?) -> Void)
    func fetchCategory(completion: @escaping ([CategoryResponse]?, Error?) -> Void)
}

class ConnectionAPI : Service {
    
    /// método Nativo
    
    func fetchTransaction(completion: @escaping ([TransactionListResponse]?, Error?) -> Void) {
        let url = URL(string: "https://desafio-it-server.herokuapp.com/lancamentos")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
               DispatchQueue.main.async {
                    completion(nil, error)
                    return
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                    return
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([TransactionListResponse].self, from: data)
                DispatchQueue.main.async {
                    completion(response, nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
    func fetchCategory(completion: @escaping ([CategoryResponse]?, Error?) -> Void) {
        let url = URL(string: "https://desafio-it-server.herokuapp.com/categorias")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                    return
                }
                return
            }
            guard let data = data else {
               DispatchQueue.main.async {
                    completion(nil, error)
                    return
                }
                return
            }
            do {
                 let decoder = JSONDecoder()
                 let response = try decoder.decode([CategoryResponse].self, from: data)
                DispatchQueue.main.async {
                    completion(response, nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        })
        task.resume()
    }
}
