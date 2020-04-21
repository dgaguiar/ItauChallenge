//
//  ViewController.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let service: Service = ConnectionAPI()

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balanceValueLabel: UILabel!
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var seachButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func setUp() {
    }
    
    @IBAction func searchTest(_ sender: UIButton) {
        service.gettingData(completion: { result in
            print(result)
        })
    }
    
    
//    @IBAction func testButton(_ sender: UIButton) {
//        service.fetchTransactions(completion: { result in
//            print(result)
//        })
//    }
    
}

