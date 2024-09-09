//
//  SettingVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 09/09/2024.
//

import UIKit

class SettingVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var cells: [ProfileCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getCellsData()
    }
    
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Setting"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
    
    private func getCellsData() {
        cells.append(contentsOf: [
            ProfileCell(title: "Change Password", subTitle: "Change Password", image: "editPassword"),
            ProfileCell(title: "Edit Profile", subTitle: "Change your information", image: "editProfile")
        ])
    }
    
    private func goToEditProfileScreen() {
        let editProfileVC = EditProfileVC(nibName: "EditProfileVC", bundle: nil)
        self.navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    private func goToEditPasswordScreen() {
        let editPassVC = ChangePasswordVC(nibName: "ChangePasswordVC", bundle: nil)
        self.navigationController?.pushViewController(editPassVC, animated: true)
    }
    
    private func navigateToSelectedCell(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            goToEditPasswordScreen()
        case 1:
            goToEditProfileScreen()
        default:
            print("N/A")
        }
    }
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        cell.configureCell(cell: cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToSelectedCell(indexPath: indexPath)
    }
}
