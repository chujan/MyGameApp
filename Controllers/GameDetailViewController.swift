//
//  GameDetailViewController.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import UIKit
import SafariServices
import ProgressHUD

class GameDetailViewController: UIViewController {
    
    
    var game : GameElement!
    var popular: PopularGame!
    var topGame: TopGame!
     

    
    @IBOutlet weak var DetailImageView: UIImageView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        

        
    }
    
    
    @IBAction func gameTapped(_ sender: UIButton)  {
       
       let gameURL = getGameUrl()
        if gameURL == nil {
            return
        }
        guard let url = URL (string: gameURL!) else { return}

        let vc = SFSafariViewController(url: url)
        
        present(vc, animated: true)
       

        
        
        
    }
    
    private  func getGameUrl() -> String? {
        if topGame?.gameURL != nil {
            return topGame.gameURL
        }
        if  popular?.gameURL != nil {
            return popular.gameURL
        }
        return game?.gameURL
        
    }
    
    private func populateView() {
       
        if (game != nil) {
            DetailImageView.kf.setImage(with: game.thumbnail.asUrl)
            tittleLabel.text = game.title
            descriptionLabel.text = game.shortDescription
            
            
            
        } else if (popular != nil) {
            DetailImageView.kf.setImage(with: popular.thumbnail.asUrl)
            tittleLabel.text = popular.title
            descriptionLabel.text = popular.shortDescription
            
            
        } else if (topGame != nil) {
            DetailImageView.kf.setImage(with: topGame.thumbnail.asUrl)
            tittleLabel.text = topGame.title
            descriptionLabel.text = topGame.shortDescription
        } else {
            
        }
    }

}
