
//
//  HOmeTransferVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 05/09/2024.
//

import UIKit

class HomeTransferVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var RecentTransactionsTable: UITableView!
    
    @IBOutlet weak var currentBalance: UILabel!
    var user: LoggedInUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecentTransactionsTable.register(UINib(nibName: "TransactionsTableTableViewCell", bundle: nil), forCellReuseIdentifier: "TransactionsTableTableViewCell")

        RecentTransactionsTable.dataSource = self
        RecentTransactionsTable.delegate = self
        getUserData()
    }
    
    func getUserData() {
        user = UserDefaultsManager.shared.getUserData()
        NetworkManager.shared.getUserBalance(id: 9, token: user?.token) { [weak self] balance, error in
            guard let self = self else { return }
            if let error = error {
                 print(error)
            }
            guard let balance else { return }
            DispatchQueue.main.async {
                self.currentBalance.text = "\(balance.balance) EGP"
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RecentTransactionsTable.dequeueReusableCell(withIdentifier: "TransactionsTableTableViewCell", for: indexPath) as! TransactionsTableTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

    @IBAction func ViewAllBtn(_ sender: UIButton) {
    }
}
