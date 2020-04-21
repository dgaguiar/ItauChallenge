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
    func fetchTransactions(completion: @escaping ([TransactionListResponse]) -> Void)
    func gettingData(completion: @escaping ([TransactionListResponse]) -> Void)
}

class ConnectionAPI : Service {

    func fetchTransactions(completion: @escaping ([TransactionListResponse]) -> Void) {
        let endpoint = "https://desafio-it-server.herokuapp.com/lancamentos"
       
        AF.request(endpoint, method: .get).responseData { response in
            let decoder = JSONDecoder()
            let movimentacoes =  try! decoder.decode([TransactionListResponse].self, from: response.data!)
            completion(movimentacoes)
        }
    }
    
    func gettingData(completion: @escaping ([TransactionListResponse]) -> Void) {
        let url = URL(string: "https://desafio-it-server.herokuapp.com/lancamentos")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.addValue("c9d5f944", forHTTPHeaderField: "X-test")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                 let decoder = JSONDecoder()
                 let response = try decoder.decode([TransactionListResponse].self, from: data)
                 completion(response)

            } catch {
                print(error)
            }
        })
        task.resume()
    }
}
