//
//  ViewController.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol: class {
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchItems()
        setupHeader() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
    }
    
    var service: Service = ConnectionAPI()
    var model: [TransactionListResponse] = []
    
    func setupHeader() {
        titleLabel.text = "my balance"
        balanceLabel.text = "R$ 900,00"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchItems() {
        service.conectMovimentacao (userId: 1){ Movimentacao in
            self.model = Movimentacao
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let itens = model[indexPath.row]
        cell.setupCell(viewModel: itens)
        
        return cell
    }
    
    
}
