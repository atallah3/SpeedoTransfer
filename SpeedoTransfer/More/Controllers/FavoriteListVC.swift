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
    
    //MARK: - Properties
    var FavoriteData: [DummyData] = []
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getFavoriteData()
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Favourite"
    }
    
    private func configureTableView() {
        tablView.register(UINib(nibName: "FavoriteListTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteListTableViewCell")
        tablView.delegate = self
        tablView.dataSource = self
    }

    private func getFavoriteData() {
        FavoriteData.append(contentsOf: [
            DummyData(name: "Asmaa Dosuky", cardNum: "Account xxxx7890"),
            DummyData(name: "Asmaa Dosuky", cardNum: "Account xxxx7890"),
            DummyData(name: "Asmaa Dosuky", cardNum: "Account xxxx7890"),
            DummyData(name: "Asmaa Dosuky", cardNum: "Account xxxx7890")
        ])
    }

}

extension FavoriteListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FavoriteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteListTableViewCell", for: indexPath) as! FavoriteListTableViewCell
        cell.configureCell(data: FavoriteData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
}
