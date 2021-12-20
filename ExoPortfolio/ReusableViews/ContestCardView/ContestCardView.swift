//
//  ContestCardView.swift
//  PicksApp
//
//  Created by Aidan Kaiser on 1/8/21.
//  Copyright © 2021 Aidan Kaiser. All rights reserved.
//

import UIKit

class ContestCardView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "ContestCardView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = self.bounds
        contentView.layer.cornerRadius = 20.0
        
        addSubview(contentView)
    }
    
    func setplanetImage(imageName: String) {
        planetImage.image = UIImage(named: imageName)
    }
    
    func setplanetName(name: String) {
        planetName.text = name
    }
    
    func setActionLabel(action: String) {
        actionLabel.text = action
    }
    
    func setDetailLabel(detail: String) {
        detailLabel.text = detail
    }
    
}
