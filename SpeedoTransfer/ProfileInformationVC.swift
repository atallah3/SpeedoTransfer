//
//  ProfileInformationVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 08/09/2024.
//

import UIKit

class ProfileInformationVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var userProfile: [UserProfile] = []
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getUserData()
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Profile information"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationTableViewCell")
    }
    
    private func getUserData() {
        userProfile.append(contentsOf: [
            UserProfile(title: "Full Name", detail: "Asmaa Dosuky"),
            UserProfile(title: "Email", detail: "Asmaa@gmail.com"),
            UserProfile(title: "Date Of Birth", detail: "12/01/2000"),
            UserProfile(title: "Country", detail: "Egypt"),
            UserProfile(title: "Bank Account", detail: "1234xxxx")
        ])
    }

}

//MARK: - Table view extension
extension ProfileInformationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
        cell.configureCell(userProfile: userProfile[indexPath.row])
        return cell
    }
}
