//
//  InformationTableViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 08/09/2024.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(userProfile: UserProfile) {
        titleLabel.text = userProfile.title
        contenLabel.text = userProfile.detail
    }
}
