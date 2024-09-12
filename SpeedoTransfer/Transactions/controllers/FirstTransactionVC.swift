//
//  FirstTransactionVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 08/09/2024.
//

import UIKit

class FirstTransactionVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lastTrasnactionsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }

    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Transactions"
    }

    private func configureTableView() {
        lastTrasnactionsTable.register(UINib(nibName: "TransactionVCTableViewCell", bundle: nil), forCellReuseIdentifier: "TransactionVCTableViewCell")
        lastTrasnactionsTable.dataSource = self
        lastTrasnactionsTable.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = lastTrasnactionsTable.dequeueReusableCell(withIdentifier: "TransactionVCTableViewCell", for: indexPath) as! TransactionVCTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDetail = TransactionDetailsVC(nibName: "TransactionDetailsVC", bundle: nil)
        navigationController?.pushViewController(toDetail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}
