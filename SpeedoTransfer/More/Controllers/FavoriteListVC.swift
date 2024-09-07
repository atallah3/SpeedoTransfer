//
//  FavoriteListVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 07/09/2024.
//

import UIKit

class FavoriteListVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var tablView: UITableView!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Functions


   

}

extension FavoriteListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
}
