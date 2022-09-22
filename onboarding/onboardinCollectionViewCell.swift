//
//  onboardinCollectionViewCell.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 21/09/2022.
//

import UIKit

class onboardinCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: onboardinCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTittleLabel: UILabel!
    
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: onboardingSlide) {
        slideImageView.image = slide.image
        slideTittleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
