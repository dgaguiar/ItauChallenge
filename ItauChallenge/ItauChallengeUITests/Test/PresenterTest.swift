//
//  PresenterTest.swift
//  ItauChallengeUITests
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import XCTest
@testable import ItauChallenge

class PresenterTest: XCTestCase {
    
    var sut: Presenter!
    var spy: ViewControllerMock!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        spy = ViewControllerMock()
        sut = Presenter(view: spy)
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        spy = nil
    }

    func testPresentViewModel() {
        sut.presentViewModel(model: [TransactionListResponse.mock()], categories: [CategoryResponse.mock()])
        
        XCTAssertFalse(spy.displayOrderByMonthCalled)
    }
    

}
