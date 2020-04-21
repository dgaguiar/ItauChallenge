//
//  MonthBalanceViewController.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class MonthBalanceViewController: UIViewController {
    
    @IBOutlet weak var contentStackView: UIStackView!
    
    var model: [Balance]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
