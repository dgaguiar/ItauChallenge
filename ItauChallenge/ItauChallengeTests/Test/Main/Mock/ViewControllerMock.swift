//
//  ViewControllerMock.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
@testable import ItauChallenge

class ViewControllerMock: ViewControllerProtocol {
 
    var displayOrderByMonthCalled = false
    var displayBalanceMonthCalled = false
    var displayFilterByMonthCalled = false
    var displayNotTransactionsAlertCalled = false
    
    func displayOrderByMonth(viewModel: [TransactionViewModel]) {
        displayOrderByMonthCalled = true
    }
    
    func displayBalanceMonth(monthModel: [TransactionViewModel]) {
        displayOrderByMonthCalled = true
    }
    
    func displayFilterByMonth(monthModel: [TransactionViewModel]) {
        displayFilterByMonthCalled = true
    }
    
    func displayNotTransactionsAlert(title: String, message: String, buttonText: String) {
        displayNotTransactionsAlertCalled = true
    }
}
