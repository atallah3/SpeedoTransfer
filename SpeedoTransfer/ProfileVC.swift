//
//  ProfileVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 31/08/2024.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var profileContent: [ProfileCell] = [
        ProfileCell(title: "Personal information", subTitle: "Your information", image: "PersonalInformation"),
        ProfileCell(title: "Setting", subTitle: "Change your settings", image: "Setting"),
        ProfileCell(title: "Payment history", subTitle: "view your transactions", image: "PaymentHistory"),
        ProfileCell(title: "My Favourite list", subTitle: "view your favourites", image: "Favorites")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureViewController()
       
    }
   
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
      
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
    }
   
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        let profileContent = profileContent[indexPath.row]
        cell.configureCell(profileCell: profileContent)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
