//
//  TableViewCell.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var valuelabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    
    func setupCell(viewModel: TransactionViewModel.Items) {
        configValue(value: viewModel.value)
        configOrigin(origin: viewModel.origin)
        configIcon(category: viewModel.category)
    }

    private func configValue(value: String) {
        valuelabel.font = .systemFont(ofSize: 14, weight: .bold)
        valuelabel.textColor = UIColor.systemRed
        valuelabel.text = value
    }
    
    private func configOrigin(origin: String) {
        originLabel.text = origin
        originLabel.font = .systemFont(ofSize: 16, weight: .regular)
        originLabel.textColor = UIColor.black
    }
    
    private func configIcon(category: String) {
        switch category {
        case "Transporte":
            categoryIcon.image = UIImage(systemName: "car")
        case "Compras Online":
            categoryIcon.image = UIImage(systemName: "creditcard")
        case "Saúde e Beleza":
            categoryIcon.image = UIImage(systemName: "bag")
        case "Serviços Automotivos":
            categoryIcon.image = UIImage(systemName: "wrench")
        case "Restaqurantes":
            categoryIcon.image = UIImage(systemName: "house")
        default:
            categoryIcon.image = UIImage(systemName: "cart")
        }
    }
    
}
