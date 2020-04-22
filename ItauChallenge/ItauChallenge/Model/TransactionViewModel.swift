//
//  TransactionViewModel.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

struct TransactionViewModel {
    struct Items {
        let month: String
        let id: Int
        let value: String
        let origin: String
        let category: String
    }
    let monthName: String
    let acumulate: String
    let transactionItems: [Items]
}

struct TransactionGroup {
    let monthName: Int
    let transctionsItems: [TransactionListResponse]
}
