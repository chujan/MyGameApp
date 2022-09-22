//
//  PopularCollectionViewCell.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularCollectionViewCell"

    @IBOutlet var tittleLabel: UILabel!
    
    @IBOutlet var popularImageView: UIImageView!
    @IBOutlet var GenreLabel: UILabel!
    
    
    func setup(popular: PopularGame) {
        tittleLabel.text = popular.title
        GenreLabel.text = popular.genre.rawValue
        popularImageView.kf.setImage(with: popular.thumbnail.asUrl)
    }
    
}
