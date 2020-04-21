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
}

class Presenter: PresenterProtocol {
    
    weak var view: ViewControllerProtocol?
     
     init(view: ViewControllerProtocol) {
         self.view = view
     }
    
    func presentViewModel(model: [TransactionListResponse], categories: [CategoryResponse]) {
        //OrderArray
        let array = model
        let orderArray = array.sorted(by: {
            $0.mounth < $1.mounth
        })
        var viewModel: [TransactionViewModel] = []
        
        for transaction in orderArray {
            let id = transaction.id
            let value = configValue(value: transaction.value)
            let origin = transaction.origin
            let category = configCategory(category: transaction.category, categoryModel: categories)
            let month = configMonth(month: transaction.mounth)
            
            let transactionItem = TransactionViewModel(id: id, value: value, origin: origin, category: category, month: month)
            viewModel.append(transactionItem)
        }
        
        view?.displayOrderByMonth(viewModel: viewModel)
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
            return "JAN"
        case 2:
            return "FEV"
        case 3:
            return "MAR"
        case 4:
            return "ABR"
        case 5:
            return "MAI"
        case 6:
            return "JUN"
        case 7:
            return "JUL"
        case 8:
            return "AGO"
        case 9:
            return "SET"
        case 10:
            return "OUT"
        case 12:
            return "NOV"
        case 12:
            return "DEZ"
        default:
            return "MES"
        }
    }
}

