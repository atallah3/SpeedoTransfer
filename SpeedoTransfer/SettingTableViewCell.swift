//
//  SettingTableViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 09/09/2024.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(cell: ProfileCell) {
        cellImageView.image = UIImage(named: cell.image)
        titleLabel.text = cell.title
        subTitleLabel.text = cell.subTitle
    }
}
