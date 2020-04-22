//
//  ViewControllerTest.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import XCTest
@testable import ItauChallenge

class ViewControllerTest: XCTestCase {

    var sut: ViewController!
    var spy: InteractorMock!
    var model: [TransactionViewModel]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        spy = InteractorMock()
        let items = TransactionViewModel.Items(month: "mes", id: 2, value: "R$ 23,50",
                                          origin: "origin", category: "transporte")
        model = [TransactionViewModel(monthName: "Janeiro", acumulate: "R$ 901,33", transactionItems: [items])]
        sut = ViewController(interactor: spy)
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        spy = nil
        model = nil
    }
    
    func testViewDidLoad() {
        let textLabel = UILabel()
        let valueLabel = UILabel()
        sut.titleLabel = textLabel
        sut.balanceLabel = valueLabel
        sut.viewDidLoad()
        
        XCTAssertFalse(spy.fetchTransactionsCalled)
    }
    
    func testReloadAllTableView() {
        let button = UIButton()
        sut.reloadAllTableView(button)
        
        XCTAssertTrue(spy.reloadAllMonthCalled)
    }
    
    func testShowMonthBalance(_ sender: UIButton) {
        let button = UIButton()
        sut.showMonthBalance(button)
        
        XCTAssertTrue(spy.goToMonthBalanceCalled)
    }
    
    func testFilterByMonth() {
        let button = UIButton()
        sut.filterByMonth(button)
        
        XCTAssertTrue(spy.getMonthTofilterCalled)
    }
    
}
