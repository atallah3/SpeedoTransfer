//
//  FavoriteListCellTableViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 07/09/2024.
//

import UIKit

class FavoriteListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCellAttributes() {
        self.backgroundColor = .clear
    }
    
    func configureCell(data: DummyData) {
        nameLabel.text = data.name
        cardNumberLabel.text = data.cardNum
    }
}
