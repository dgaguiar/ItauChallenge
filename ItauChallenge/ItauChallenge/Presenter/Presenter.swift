//
//  Presenter.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterProtocol: class {
    func presentViewModel(model: [TransactionListResponse], categories: [CategoryResponse])
    func presentBalanceMonth()
    func presentReloadAllMonth()
    func presentFilterByMonth(month: String)
}

class Presenter: PresenterProtocol {
    
    weak var view: ViewControllerProtocol?
    private var viewModel: [TransactionViewModel] = []
     
     init(view: ViewControllerProtocol) {
         self.view = view
     }
    
    func presentViewModel(model: [TransactionListResponse], categories: [CategoryResponse]) {
        let array = model
        let orderArray = array.sorted(by: { $0.month < $1.month })
        
        var monthAgroup: [TransactionGroup] = []
        
        let unique = Array(Set(orderArray)).sorted(by: { $0.month < $1.month })
        for item in unique{
            
            let monthOrder = orderArray.filter({ return $0.month == item.month})
            let trans = TransactionGroup(monthName: item.month, transctionsItems: monthOrder)
            monthAgroup.append(trans)
        }
        
        for transaction in monthAgroup {
            var transactionItem: [TransactionViewModel.Items] = []
            var acumualteBalance: Double = 0.0
            for items in transaction.transctionsItems {
                let id = items.id
                let value = configValue(value: items.value)
                let origin = items.origin
                let category = configCategory(category: items.category, categoryModel: categories)
                let month = configMonth(month: items.month)
                
                transactionItem.append(TransactionViewModel.Items(month: month, id: id, value: value, origin: origin, category: category))
                acumualteBalance += items.value
            }
            let monthName = configMonth(month: transaction.monthName)
            let balanceMonth = configValue(value: acumualteBalance)
            viewModel.append(TransactionViewModel(monthName: monthName, acumulate: balanceMonth, transactionItems: transactionItem))
        }
        
        view?.displayOrderByMonth(viewModel: viewModel)
    }
    
    func presentBalanceMonth() {
        view?.displayBalanceMonth(monthModel: viewModel)
    }
    
    func presentReloadAllMonth() {
        view?.displayOrderByMonth(viewModel: viewModel)
    }
    
    func presentFilterByMonth(month: String) {
        guard let monthInt = Int(month) else { return }
        let monthFormatter = configMonth(month: monthInt)
        let modelFilterMonth = viewModel.filter({ return $0.monthName == monthFormatter })
        
        if modelFilterMonth.isEmpty {
            let title = "Hey"
            let message = "Você não possui lançamentos em \(monthFormatter)"
            let buttonText = "Entendi"
            view?.displayNotTransactionsAlert(title: title, message: message, buttonText: buttonText)
        } else {
             view?.displayFilterByMonth(monthModel: modelFilterMonth)
        }
       
    }
    
    private func configValue(value: Double) -> String {
        let formatter = NumberFormatter()
        let locale = Locale.init(identifier: "pt-BR")
        formatter.locale = locale
        formatter.numberStyle = .currency
        guard let formattedTipAmount = formatter.string(from: value as NSNumber) else { return ""}
        
        return formattedTipAmount
    }
    
    private func configCategory(category: Int, categoryModel: [CategoryResponse]) -> String {
        var categoryName: String = ""
        for model in categoryModel {
            if category == model.id {
                categoryName = model.name
            }
        }
        return categoryName
    }

    private func configMonth(month: Int) -> String {
        switch month {
        case 1:
            return "Janeiro"
        case 2:
            return "Fevereiro"
        case 3:
            return "Março"
        case 4:
            return "Abril"
        case 5:
            return "Maio"
        case 6:
            return "Junho"
        case 7:
            return "Julho"
        case 8:
            return "Agosto"
        case 9:
            return "Setembro"
        case 10:
            return "Outubro"
        case 11:
            return "Novembro"
        case 12:
            return "Dezembro"
        default:
            return "MES"
        }
        
    }
}
