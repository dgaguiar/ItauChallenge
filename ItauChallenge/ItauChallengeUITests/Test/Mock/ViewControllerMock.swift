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
    func displayOrderByMonth(viewModel: [TransactionGroup]) {
        //
    }
    
    
    var displayOrderByMonthCalled = false
    var displayBalanceMonthCalled = false
    
    func displayOrderByMonth(viewModel: [TransactionViewModel]) {
        displayOrderByMonthCalled = true
    }
    
    func displayBalanceMonth(monthModel: Balance) {
        displayBalanceMonthCalled = true
    }
    
    
}
