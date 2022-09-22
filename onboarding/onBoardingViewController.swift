//
//  onBoardingViewController.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 21/09/2022.
//

import UIKit

class onBoardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [onboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [ onboardingSlide(title: "Your collection in one place" , description: "Save easily all your games and manage your collection.", image: #imageLiteral(resourceName: "slide1") ),
                   onboardingSlide(title: "Find the perfect game" , description: "Want a quick game?, a family game? or maybe a solo game? We find for you the best match", image: #imageLiteral(resourceName: "slide2")),
                   onboardingSlide(title: "See your statistics", description: "Save your game results, and discover statistics about your games parties", image: #imageLiteral(resourceName: "slide3"))
        ]
        
        pageControl.numberOfPages = slides.count

        
    }
    
    
    
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let  controller = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
            
        }
    }
    
        
    
    
        
        
        
    
    
    
    

}

extension onBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: onboardinCollectionViewCell.identifier, for: indexPath) as! onboardinCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
  
    
}
