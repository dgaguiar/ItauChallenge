//
//  DetailTransactionViewController.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class DetailTransactionViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var model: TransactionViewModel.Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    func setup() {
        guard let model = model else { return }
        valueLabel.text = model.value
        originLabel.text = model.origin
        monthLabel.text = "Mês: \(model.month)"
        categoryLabel.text = model.category
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
