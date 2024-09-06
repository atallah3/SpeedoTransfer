//
//  OnboardingCollectionViewCell.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 06/09/2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var onboardingImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(slide: OnboardingSlide) {
        self.onboardingImageView.image = slide.image
        self.titleLabel.text = slide.title
        self.bodyLabel.text = slide.subTitle
    }
}
