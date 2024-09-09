//
//  CountryBottomSheetVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 06/09/2024.
//

import UIKit

protocol CountrySelectionDelegate: AnyObject {
    func countryDidSelect(name: String)
}

class CountryBottomSheetVC: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    weak var delegate: CountrySelectionDelegate?
    var countries: [Country] = []

    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getCountryData()
    }
    
   //MARK: - Functions
    private func configureTableView() {
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getCountryData() {
        countries.append(contentsOf: [
            Country(image: UIImage(named: "Egypt1")!, name: "Egypt"),
            Country(image: UIImage(named: "Saudia2")!, name: "Saudia Arabia"),
            Country(image: UIImage(named: "Emirates3")!, name: "Emirates"),
            Country(image: UIImage(named: "US4")!, name: "United States")
        ])
    }
}

    //MARK: - tableViewExtension
extension CountryBottomSheetVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.configureCell(country: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row].name
        delegate?.countryDidSelect(name: selectedCountry)
        self.dismiss(animated: true)
    }
}
