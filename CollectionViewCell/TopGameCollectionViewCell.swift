//
//  TopGameCollectionViewCell.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import UIKit

class TopGameCollectionViewCell: UICollectionViewCell {
    static let identifier = "TopGameCollectionViewCell"

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func setValue(topGame: TopGame) {
        topImageView.kf.setImage(with: topGame.thumbnail.asUrl)
        titleLabel.text = topGame.title
        dateLabel.text = topGame.shortDescription
    }
    
    
}
