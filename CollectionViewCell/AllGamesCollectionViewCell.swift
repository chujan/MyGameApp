//
//  AllGamesCollectionViewCell.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import UIKit
import Kingfisher

class AllGamesCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: AllGamesCollectionViewCell.self)

    
    @IBOutlet weak var AllGamesImageView: UIImageView!
    
    @IBOutlet var AllGamesLabel: UILabel!
    
    
    func setUp(game: GameElement) {
        AllGamesLabel.text = game.title
        AllGamesImageView.kf.setImage(with: game.thumbnail.asUrl)
        
    }
    
    
}
