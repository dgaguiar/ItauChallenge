//
//  Interactor.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation

protocol InteractorProtocol: class {
    func fetchTransactions()
    func goToMonthBalance()
}

class Interactor: InteractorProtocol {
    
    var presenter: PresenterProtocol?
    var respository: Service = ConnectionAPI()
    var model: [TransactionListResponse] = []
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchTransactions() {
        respository.connectTransaction(completion:  ({ Movimentacao in
            self.fetchlancamentos(model: Movimentacao)
        }))
    }
    
    private func fetchlancamentos(model: [TransactionListResponse]) {
        respository.connectCategory(completion:  ({ Category  in
            self.presenter?.presentViewModel(model: model, categories: Category)
        }))
    }
    
    func goToMonthBalance() {
        presenter?.presentBalanceMonth()
    }
}
