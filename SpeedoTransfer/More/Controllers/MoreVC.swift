//
//  MoreVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 07/09/2024.
//

import UIKit

class MoreVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var moreCells: [MoreCell] = []
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getMoreCellsData()
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "More"
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getMoreCellsData() {
        moreCells.append(contentsOf: [
            MoreCell(image: UIImage(named: "MoreWebsite")!, name: "Transfer From Website"),
            MoreCell(image: UIImage(named: "MoreFavorite")!, name: "Favourites"),
            MoreCell(image: UIImage(named: "MoreUser")!, name: "Profile"),
            MoreCell(image: UIImage(named: "MoreHelp")!, name: "Help"),
            MoreCell(image: UIImage(named: "Morelogout")!, name: "logout")

        ])
    }
    
    private func goToHelpVC() {
        let HelpVC = HelpVC(nibName: "HelpVC", bundle: nil)
        self.showBottomSheet(viewController: HelpVC)
    }
    
    private func goToFavoriteVC() {
        let favoriteVC = FavoriteListVC(nibName: "FavoriteListVC", bundle: nil)
        self.navigationController?.pushViewController(favoriteVC, animated: true)
    }
    
    private func goToProfileScreen() {
        let profileVC = ProfileVC(nibName: "ProfileVC", bundle: nil)
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    private func navigateToSelectedTab(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("go to Transfer from wesite")
        case 1:
            goToFavoriteVC()
        case 2:
            goToProfileScreen()
        case 3:
            goToHelpVC()
        case 4:
            print("Log out")
        default:
            print("N/A")
        }
    }

}

    //MARK: - tableView extension
extension MoreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moreCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        cell.configureCell(moreCells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToSelectedTab(indexPath: indexPath)
    }
}

