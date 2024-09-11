
//
//  HOmeTransferVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 05/09/2024.
//

import UIKit

class HomeTransferVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var RecentTransactionsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecentTransactionsTable.register(UINib(nibName: "TransactionsTableTableViewCell", bundle: nil), forCellReuseIdentifier: "TransactionsTableTableViewCell")

        RecentTransactionsTable.dataSource = self
        RecentTransactionsTable.delegate = self
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
