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
    func displayBalanceMonth(monthModel: [TransactionViewModel])
    func displayFilterByMonth(monthModel: [TransactionViewModel])
    func displayNotTransactionsAlert(title: String, message: String, buttonText: String)
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var filterView: UIView!
    
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
    
    @IBAction func reloadAllTableView(_ sender: UIButton) {
        interactor?.reloadAllMonth()
    }
    
    
    @IBAction func showMonthBalance(_ sender: UIButton) {
        interactor?.goToMonthBalance()
    }
    
    @IBAction func showFilter(_ sender: UIButton) {
        var rotate: CGFloat = 0.0
        if filterView.isHidden {
            filterView.isHidden = false
            rotate = CGFloat.pi - 0.01
        } else {
            filterView.isHidden  = true
            rotate = 0.01
        }
        UIView.animate(withDuration: 0.3, animations: {
            sender.transform = CGAffineTransform(rotationAngle: rotate)
        })
    }
    
    @IBAction func filterByMonth(_ sender: UIButton) {
        let label = sender.restorationIdentifier
        interactor?.getMonthTofilter(month: label ?? "erro")
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
    }
    
    func displayBalanceMonth(monthModel: [TransactionViewModel]) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "MonthBalanceViewController") as? MonthBalanceViewController {
            controller.model = monthModel
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func displayFilterByMonth(monthModel: [TransactionViewModel]) {
        self.model = monthModel
        tableView.reloadData()
    }
    
    func displayNotTransactionsAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToDetail(detailModel: TransactionViewModel.Items) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailTransactionViewController") as? DetailTransactionViewController {
            controller.model = detailModel
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].transactionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let itens = model[indexPath.section].transactionItems[indexPath.row]
        cell.setupCell(viewModel: itens)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetail(detailModel: model[indexPath.section].transactionItems[indexPath.row])
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model[section].monthName
    }
}
