//
//  TransactionListModel.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation

struct TransactionListResponse: Codable {
    
    let id: Int?
    let value: Double?
    let origin: String?
    let category: Int?
    let mounth: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case value = "valor"
        case origin = "origem"
        case category = "categoria"
        case mounth = "mes_lancamento"
    }
}
