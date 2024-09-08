//
//  ProfileVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 31/08/2024.
//

import UIKit

class ProfileVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var profileContent: [ProfileCell] = []
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureViewController()
        getProfileData()
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Profile"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    private func getProfileData() {
        profileContent.append(contentsOf: [
            
            ProfileCell(title: "Personal information", subTitle: "Your information", image: "PersonalInformation"),
            ProfileCell(title: "Setting", subTitle: "Change your settings", image: "Setting"),
            ProfileCell(title: "Payment history", subTitle: "view your transactions", image: "PaymentHistory"),
            ProfileCell(title: "My Favourite list", subTitle: "view your favourites", image: "Favorites")
            
        ])
    }
    
    private func goToFavoriteScreen() {
        let favoriteVC = FavoriteListVC(nibName: "FavoriteListVC", bundle: nil)
        self.navigationController?.pushViewController(favoriteVC, animated: true)
    }
    
    private func goToProfileInfoScreen() {
        let ProfileVC = ProfileInformationVC(nibName: "ProfileInformationVC", bundle: nil)
        self.navigationController?.pushViewController(ProfileVC, animated: true)
    }

    
    private func navigateToSelectedCell(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            goToProfileInfoScreen()
        case 1:
            print("go to Setting")
        case 2:
            print("go to Payment history")
        case 3:
            goToFavoriteScreen()
        default:
            print("N/A")
        }
    }
}

//MARK: - Table view extension
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
        88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToSelectedCell(indexPath: indexPath)
    }
}
