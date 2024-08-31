//
//  ProfileTableViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 31/08/2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellForUsage()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureCellForUsage() {
        self.accessoryType = .disclosureIndicator
        self.backgroundColor = .clear
    }
    
    func configureCell(profileCell: ProfileCell) {
        titleLabel.text = profileCell.title
        subTitleLabel.text = profileCell.subTitle
        cellImageView.image = UIImage(named: profileCell.image)
    }
}
