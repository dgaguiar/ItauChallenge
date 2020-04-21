//
//  InteractorTest.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import XCTest
@testable import ItauChallenge

class InteractorTest: XCTestCase {
    
    var sut: Interactor!
    var spy: PresenterMock!
    var repositoryMock: ConnectionAPIMock!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        spy = PresenterMock()
        sut = Interactor(presenter: spy)
        sut.respository = ConnectionAPIMock()
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        spy = nil
    }

    
    func testFetchTransactions() {
        sut.fetchTransactions()
        
        XCTAssertFalse(repositoryMock.connectTransactionCalled)
    }
    
    func testGoToMonthBalance() {
        sut.goToMonthBalance()
        
        XCTAssertFalse(spy.presentBalanceMonthCalled)
    }
    
}
