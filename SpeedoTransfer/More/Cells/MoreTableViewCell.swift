//
//  MoreTableViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 07/09/2024.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moreImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAttributes()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCellAttributes() {
        self.accessoryType = .disclosureIndicator
        self.backgroundColor = .clear
    }
    
    func configureCell(_ cell: MoreCell) {
        self.moreImageView.image = cell.image
        self.nameLabel.text = cell.name
    }
}
