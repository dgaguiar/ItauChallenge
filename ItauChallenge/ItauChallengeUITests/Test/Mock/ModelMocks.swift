//
//  ModelMocks.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
@testable import ItauChallenge


class ConnectionAPIMock: Service {
    
    var fetchTransactionCalled = false
    var connectTransactionCalled = false
    var connectCategoryCalled = false
    
    func fetchTransaction(completion: @escaping ([TransactionListResponse]) -> Void) {
        fetchTransactionCalled = true
    }
    
    func connectTransaction(completion: @escaping ([TransactionListResponse]) -> Void) {
        connectTransactionCalled = true
    }
    
    func connectCategory(completion: @escaping ([CategoryResponse]) -> Void) {
        connectCategoryCalled = true
    }
    
}


extension TransactionListResponse {
    static func mock() -> TransactionListResponse {
        return TransactionListResponse(id: 0, value: 12.3, origin: "lojas", category: 2, mounth: 3)
    }
}

extension CategoryResponse {
    static func mock() -> CategoryResponse {
        return CategoryResponse(id: 0, name: "Transporte")
    }
}
