//
//  NotificationVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 08/09/2024.
//

import UIKit

class NotificationVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var NotificationCenter: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.register(UINib(nibName: "Notify", bundle: nil), forCellReuseIdentifier: "Notify")
        NotificationCenter.dataSource = self
        NotificationCenter.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NotificationCenter.dequeueReusableCell(withIdentifier: "Notify", for: indexPath) as! Notify
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDetail = TransactionDetailsVC(nibName: "TransactionDetailsVC", bundle: nil)
        navigationController?.pushViewController(toDetail, animated: true)
    }
}
