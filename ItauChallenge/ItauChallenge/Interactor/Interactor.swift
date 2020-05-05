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
    func reloadAllMonth()
    func getMonthTofilter(month: String)
}

class Interactor: InteractorProtocol {
    
    var presenter: PresenterProtocol?
    var respository: Service = ConnectionAPI()
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchTransactions() {
        respository.fetchTransaction(completion:  ({ Movimentacao in
            self.fetchlancamentos(model: Movimentacao)
        }))
    }
    
    private func fetchlancamentos(model: [TransactionListResponse]) {
        respository.fetchCategory(completion:  ({ Category  in
            self.presenter?.presentViewModel(model: model, categories: Category)
        }))
    }
    
    func reloadAllMonth() {
        presenter?.presentReloadAllMonth()
    }
    
    func getMonthTofilter(month: String) {
        presenter?.presentFilterByMonth(month: month)
    }
    
    func goToMonthBalance() {
        presenter?.presentBalanceMonth()
    }
}
