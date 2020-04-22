//
//  MonthBalanceTableViewCellTest.swift
//  ItauChallengeTests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import XCTest
@testable import ItauChallenge

class MonthBalanceTableViewCellTest: XCTestCase {

    var sut: MonthBalanceTableViewCell!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MonthBalanceTableViewCell()
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSetupCell() {
        let monthLabel = UILabel()
        let monthValueLabel = UILabel()
        sut.monthLabel = monthLabel
        sut.monthValueLabel = monthValueLabel
        let month = "mes"
        let balance = "R$ 90,00"
        sut.setupCell(month: month, balanceValue: balance)
        
        XCTAssertEqual(sut.monthLabel.text, month)
        XCTAssertEqual(sut.monthValueLabel.text, balance)
    }
}
