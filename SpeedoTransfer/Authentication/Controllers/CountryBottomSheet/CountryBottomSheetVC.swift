//
//  CountryBottomSheetVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 06/09/2024.
//

import UIKit

class CountryBottomSheetVC: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    weak var parentVC: UIViewController?
    let countriesName = ["Egypt", "Saudia Arabia", "Emirates" ,"United States"]
    let countriesImage: [UIImage?] = [
        UIImage(named: "Egypt1"),
        UIImage(named: "Saudia2"),
        UIImage(named: "Emirates3"),
        UIImage(named: "US4")
    ]

    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       configureTableView()
    }
    
   //MARK: - Functions
    private func configureTableView() {
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

    //MARK: - tableViewExtension
extension CountryBottomSheetVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        
        let image = countriesImage[indexPath.row]
        let name = countriesName[indexPath.row]
        cell.configureCell(countryImage: image!, countryName: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countriesName[indexPath.row]
        
        guard let parent = parentVC as? ContinuedSignUpVC else { return }
        parent.selectedCountry = selectedCountry
        self.dismiss(animated: true)
    }
}
