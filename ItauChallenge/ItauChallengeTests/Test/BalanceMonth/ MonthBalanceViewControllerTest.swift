//
//  MonthBalanceViewController.swift
//  ItauChallengeTests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import XCTest
@testable import ItauChallenge

class MonthBalanceViewControllerTest: XCTestCase {
    
    var sut: MonthBalanceViewController!
    var model: [TransactionViewModel]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MonthBalanceViewController()
        model = [TransactionViewModel(monthName: "mes", acumulate: "R$ 20,10",
                                      transactionItems: [TransactionViewModel.Items(month: "mes", id: 2, value: "R$ 23,50",
                                                                                    origin: "origin", category: "transporte")])]
        sut.model = model
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        model = nil
    }
    
    func testViewDidLoad() {
        let tableView = UITableView()
        sut.tableView = tableView
        sut.viewDidLoad()
        
        XCTAssertNotNil(sut.model)
    }

}
