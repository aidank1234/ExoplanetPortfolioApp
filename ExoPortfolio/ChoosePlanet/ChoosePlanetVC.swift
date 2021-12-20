//
//  ChoosePlanetVC.swift
//  ExoPortfolio
//
//  Created by Aidan Kaiser on 12/19/21.
//

import UIKit
import UPCarouselFlowLayout

class ChoosePlanetVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var planetCardCarouselView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        planetCardCarouselView.dataSource = self
        planetCardCarouselView.delegate = self
        planetCardCarouselView.backgroundColor = UIColor.clear
        planetCardCarouselView.showsHorizontalScrollIndicator = false
        planetCardCarouselView.showsVerticalScrollIndicator = false
        
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 25.0)
        layout.itemSize = CGSize(width: 275, height: 330)
        planetCardCarouselView.reloadData()
        planetCardCarouselView.collectionViewLayout = layout
        
        planetCardCarouselView.reloadData()
        
        // Make navigation bar clear
        setNavbarToClear()
        
        // Swipe to pop view controller
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
    }
    
    @objc func moveToPlanetProperties(_ sender: UITapGestureRecognizer) {
        if let indexPath = self.planetCardCarouselView?.indexPathForItem(at: sender.location(in: self.planetCardCarouselView)) {
            let cell = self.planetCardCarouselView?.cellForItem(at: indexPath) as! PlanetCardCell
            if cell.cardView.planetName.text == "Migrating Jupiter" {
                if let destController = self.storyboard?.instantiateViewController(withIdentifier: "exoplanetProperties") as? ExoplanetPropertiesVC {
                    destController.modalPresentationStyle = .overFullScreen
                    destController.planet = "jupiter"
                    self.navigationController?.pushViewController(destController, animated: true)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planetCard", for: indexPath) as! PlanetCardCell
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.moveToPlanetProperties(_:)))
        cell.cardView.addGestureRecognizer(tapGesture)
        
        cell.cardView.actionLabel.text = "Tap to Begin Journey"
        if indexPath.row == 0 {
            cell.cardView.planetImage.image = UIImage(named: "jupiter")
            cell.cardView.planetName.text = "Migrating Jupiter"
            cell.cardView.setDetailLabel(detail: "A Jupiter-like planet that originally formed beyond the frost line. Will it become a hot Jupiter?")
        } else {
            cell.cardView.planetImage.image = UIImage(named: "cottonCandy")
            cell.cardView.planetName.text = "Super-puff Planet"
            cell.cardView.setDetailLabel(detail: "A planet with a density near that of cotton candy. How is this even possible?")
        }
        
        return cell
    }
    

}
