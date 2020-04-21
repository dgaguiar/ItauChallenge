//
//  InteractorMock.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
@testable import ItauChallenge

class InteractorMock: InteractorProtocol {
    
    var fetchTransactionsCalled = false
    var goToMonthBalanceCalled = false
    
    func fetchTransactions() {
        fetchTransactionsCalled = true
    }
    
    func goToMonthBalance() {
        goToMonthBalanceCalled = true
    }
    
}
