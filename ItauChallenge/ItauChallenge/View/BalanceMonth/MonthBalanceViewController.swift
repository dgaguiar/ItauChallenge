//
//  MonthBalanceViewController.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 21/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit
import Foundation

class MonthBalanceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var model: [TransactionViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model)
        setupTableView()
        resizeTableViewIfNeeded()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    private func resizeTableViewIfNeeded() {
        if tableViewHeight.constant != tableView.contentSize.height {
            tableViewHeight.constant = tableView.contentSize.height
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension MonthBalanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MonthBalanceTableViewCell", for: indexPath) as! MonthBalanceTableViewCell
        let itens = model[indexPath.section].monthName
        let balance = model[indexPath.section].acumulate
        cell.setupCell(month: itens, balanceValue: balance)
        
        return cell
    }
    
}
