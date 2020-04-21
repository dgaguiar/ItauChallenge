//
//  ViewController.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol: class {
    
    func displayOrderByMonth(viewModel: [TransactionViewModel])
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var interactor: InteractorProtocol?
    var model: [TransactionViewModel] = []
    // MARK: Constructors
    
    init(interactor: InteractorProtocol){
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.fetchTransactions()
        setupHeader() 
    }
    
    func setupUI() {
        let presenter = Presenter(view: self)
        interactor = Interactor(presenter: presenter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
    }
    
    
    func setupHeader() {
        titleLabel.text = "my balance"
        balanceLabel.text = "R$ 900,00"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func displayOrderByMonth(viewModel: [TransactionViewModel]) {
        self.model = viewModel
        tableView.reloadData()
        print(viewModel)
    }
    
    func goToDetail(detailModel: TransactionViewModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailTransactionViewController") as? DetailTransactionViewController {
            controller.model = detailModel
            self.navigationController?.pushViewController(controller, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetail(detailModel: model[indexPath.row])
    }
    
}
