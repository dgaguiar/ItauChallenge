//
//  NetworknigConnection.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
import Alamofire


protocol Service {
    func fetchTransaction(completion: @escaping ([TransactionListResponse]) -> Void)
    func fetchCategory(completion: @escaping ([CategoryResponse]) -> Void)
    func connectTransaction(completion: @escaping ([TransactionListResponse]) -> Void )
    func connectCategory(completion: @escaping ([CategoryResponse]) -> Void )
}

class ConnectionAPI : Service {

    /// método com Framework - Alamofire
    
    func connectTransaction(completion: @escaping ([TransactionListResponse]) -> Void ) {
        let endpoint = "https://desafio-it-server.herokuapp.com/lancamentos"
        
        AF.request(endpoint, method: .get).responseData { response in
            let decoder = JSONDecoder()
            let movimentacoes =  try! decoder.decode([TransactionListResponse].self, from: response.data!)
            completion(movimentacoes)
        }
    }
    
    func connectCategory(completion: @escaping ([CategoryResponse]) -> Void ) {
        let endpoint = "https://desafio-it-server.herokuapp.com/categorias"
        
        AF.request(endpoint, method: .get).responseData { response in
            let decoder = JSONDecoder()
            let lancamentos =  try! decoder.decode([CategoryResponse].self, from: response.data!)
            completion(lancamentos)
        }
    }
    
    /// método Nativo
    
    func fetchTransaction(completion: @escaping ([TransactionListResponse]) -> Void) {
        let url = URL(string: "https://desafio-it-server.herokuapp.com/lancamentos")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "Check your connections")
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([TransactionListResponse].self, from: data)
                DispatchQueue.main.async {
                    completion(response)
                }
                
            } catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
    func fetchCategory(completion: @escaping ([CategoryResponse]) -> Void) {
        let url = URL(string: "https://desafio-it-server.herokuapp.com/categorias")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                 let decoder = JSONDecoder()
                 let response = try decoder.decode([CategoryResponse].self, from: data)
                DispatchQueue.main.async {
                    completion(response)
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
