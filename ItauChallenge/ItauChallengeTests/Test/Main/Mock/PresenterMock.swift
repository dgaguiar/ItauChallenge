//
//  PresenterMock.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
@testable import ItauChallenge

class PresenterMock: PresenterProtocol {

    var presentViewModelCalled = false
    var presentBalanceMonthCalled = false
    var presentReloadAllMonthCalled = false
    var presentFilterByMonthCalled = false
    
    func presentViewModel(model: [TransactionListResponse], categories: [CategoryResponse]) {
        presentViewModelCalled = true
    }
    
    func presentBalanceMonth() {
        presentBalanceMonthCalled = true
    }
    
    func presentReloadAllMonth() {
        presentReloadAllMonthCalled = true
    }
    
    func presentFilterByMonth(month: String) {
        presentFilterByMonthCalled = true
    }

}
