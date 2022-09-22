//
//  HomeViewController.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 18/09/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    var games = [GameElement]()
    var populars = [PopularGame]()
    var topGames = [TopGame]()
    

    @IBOutlet var AllGamesCollectionView: UICollectionView!
    
   
    @IBOutlet weak var PopularCollectionView: UICollectionView!
    
    @IBOutlet weak var TopRatedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        ProgressHUD.show()

        APICaller.shared.fetch { [weak self]  result in
            switch result {
            case .success(let gam):
                ProgressHUD.dismiss()
                DispatchQueue.main.async {
                    self?.games = gam
                    self?.AllGamesCollectionView.reloadData()
                }
                
                //print(gam)
            case .failure(let error):
                print("Fetching failed with: \(error)")
            }
        }
        APICaller.shared.get { [weak self]  result in
            switch result {
            case .success(let pop):
                DispatchQueue.main.async {
                    self?.populars = pop
                    self?.PopularCollectionView.reloadData()
                }
                
               // print(pop)
            case .failure(let error):
                print("Fetching failed with: \(error)")
            }
        }
        
        APICaller.shared.getTopGames{ [weak self]  result in
            switch result {
            case .success(let top):
                DispatchQueue.main.async {
                    self?.topGames = top
                    self?.TopRatedCollectionView.reloadData()
                }
                
                print(top)
            case .failure(let error):
                print("Fetching failed with: \(error)")
            }
        }
        
        
        
    }
    

    private  func  registerCells() {
        AllGamesCollectionView.register(UINib(nibName: AllGamesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AllGamesCollectionViewCell.identifier)
        
        PopularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        TopRatedCollectionView.register(UINib(nibName: TopGameCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopGameCollectionViewCell.identifier)
    }

}
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case AllGamesCollectionView:
            return games.count
        case PopularCollectionView:
            return populars.count
        case TopRatedCollectionView:
            return topGames.count
        default:
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case AllGamesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllGamesCollectionViewCell.identifier, for: indexPath) as! AllGamesCollectionViewCell
            cell.setUp(game: games[indexPath.row])
            return cell
        case PopularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(popular: populars[indexPath.row])
            return cell
            
        case TopRatedCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopGameCollectionViewCell.identifier, for: indexPath) as! TopGameCollectionViewCell
            cell.setValue(topGame: topGames[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contoller = GameDetailViewController.instantiate()
        switch collectionView {
        case AllGamesCollectionView:
            contoller.game = games[indexPath.row]
        case PopularCollectionView:
            contoller.popular = populars[indexPath.row]
        case TopRatedCollectionView:
            contoller.topGame = topGames[indexPath.row]
        default:
            return
        }
        navigationController?.pushViewController(contoller, animated: true)
    }
    
    
}
