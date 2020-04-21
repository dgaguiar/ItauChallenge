//
//  TableViewCell.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var valuelabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    
    
    func setupCell(viewModel: TransactionListResponse) {
        configValue(value: viewModel.value)
        configOrigin(origin: viewModel.origin)
        configIcon(category: viewModel.category)
        print("veio na cell")
    }

    func configValue(value: Double) {
        let formatter = NumberFormatter()
        let locale = Locale.init(identifier: "pt-BR")
        formatter.locale = locale
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: value as NSNumber) {
            valuelabel.text = "\(formattedTipAmount)"
        }
        
        valuelabel.font = .systemFont(ofSize: 14, weight: .bold)
        valuelabel.textColor = UIColor.systemRed
    }
    
    func configOrigin(origin: String) {
        originLabel.text = origin
        originLabel.font = .systemFont(ofSize: 16, weight: .regular)
        originLabel.textColor = UIColor.black
    }
    
    func configIcon(category: Int) {
        switch category {
        case 1:
            categoryIcon.image = UIImage(named: "pay")
        case 2:
            categoryIcon.image = UIImage(named: "bag")
        case 3:
            categoryIcon.image = UIImage(named: "fuel")
        case 4:
            categoryIcon.image = UIImage(named: "pig")
        default:
            categoryIcon.image = UIImage(named: "more")
        }
    }
    
}
