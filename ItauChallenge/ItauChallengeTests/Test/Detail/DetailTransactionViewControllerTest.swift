//
//  DetailTransactionViewControllerTest.swift
//  ItauChallengeTests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import XCTest
@testable import ItauChallenge

class DetailTransactionViewControllerTest: XCTestCase {
    
    var sut: DetailTransactionViewController!
    var model: TransactionViewModel.Items!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = DetailTransactionViewController()
        model = TransactionViewModel.Items(month: "mes", id: 2, value: "R$ 23,50",
                                           origin: "origin", category: "transporte")
        sut.model = model
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        model = nil
    }

    func testSetup() {
        let category = UILabel()
        let value = UILabel()
        let origin = UILabel()
        let month = UILabel()
        sut.categoryLabel = category
        sut.valueLabel = value
        sut.originLabel = origin
        sut.monthLabel = month
        
        sut.setup()
        
        XCTAssertEqual(sut.categoryLabel.text, self.model.category)
        XCTAssertEqual(sut.valueLabel.text, self.model.value)
        XCTAssertEqual(sut.originLabel.text, self.model.origin)
        XCTAssertEqual(sut.monthLabel.text, self.model.month)
        
    }
    

}
