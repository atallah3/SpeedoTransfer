//
//  CountryTableViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 06/09/2024.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(country: Country) {
        self.countryName.text = country.name
        self.countryImage.image = country.image
    }
}
