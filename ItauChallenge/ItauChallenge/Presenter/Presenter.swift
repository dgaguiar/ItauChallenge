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
}

class Presenter: PresenterProtocol {
    
    weak var view: ViewControllerProtocol?
    private var viewModel: [TransactionViewModel] = []
    private var jan = 0.0,fev = 0.0,mar = 0.0,abr = 0.0,mai = 0.0,jun = 0.0,
    jul = 0.0,ago = 0.0,set = 0.0,out = 0.0,nov = 0.0,dez = 0.0
     
     init(view: ViewControllerProtocol) {
         self.view = view
     }
    
    func presentViewModel(model: [TransactionListResponse], categories: [CategoryResponse]) {
        //OrderArray by month
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
            for items in transaction.transctionsItems {
                let id = items.id
                let value = configValue(value: items.value)
                let origin = items.origin
                let category = configCategory(category: items.category, categoryModel: categories)
                let month = configMonth(month: items.month)
                
                transactionItem = [TransactionViewModel.Items(month: month, id: id, value: value, origin: origin, category: category)]
                
//                viewModel.append(transactionItem)
            }
            let monthName = configMonth(month: transaction.monthName)
            viewModel = [TransactionViewModel(monthName: monthName, transactionItems: transactionItem)]
        }
        
        view?.displayOrderByMonth(viewModel: viewModel)
    }
    
    func presentBalanceMonth() {

        let balance = Balance(jan: jan, fev: fev, mar: mar, mai: mai, jun: jun, jul: jul, ago: ago, set: set, out: out, nov: nov, dez: dez)
        view?.displayBalanceMonth(monthModel: balance)
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
//            jan += value
            return "Janeiro"
        case 2:
//            fev += value
            return "Fevereiro"
        case 3:
//            mar += value
            return "Março"
        case 4:
//            abr += value
            return "Abril"
        case 5:
//            mai += value
            return "Maio"
        case 6:
//            jun += value
            return "Junho"
        case 7:
//            jul += value
            return "Julho"
        case 8:
//            ago += value
            return "Agosto"
        case 9:
//            set += value
            return "Setembro"
        case 10:
//            out += value
            return "Outubro"
        case 11:
//            nov += value
            return "Novembro"
        case 12:
//            dez += value
            return "Dezembro"
        default:
            return "MES"
        }
        
    }
}

struct Balance {
    let jan: Double
    let fev: Double
    let mar: Double
    let mai: Double
    let jun: Double
    let jul: Double
    let ago: Double
    let set: Double
    let out: Double
    let nov: Double
    let dez: Double
}
