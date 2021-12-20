//
//  ContestReviewView.swift
//  PicksApp
//
//  Created by Aidan Kaiser on 1/14/21.
//  Copyright © 2021 Aidan Kaiser. All rights reserved.
//

import UIKit

class ContestReviewView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var contestReviewTitle: UILabel!
    @IBOutlet weak var contestDetail: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "ContestReviewView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = self.bounds
        contentView.layer.cornerRadius = 20.0
        
        addSubview(contentView)
    }
    
    func setContestReviewTitleText(text: String) {
        contestReviewTitle.text = text
    }
    
    func setContestDetailText(text: String) {
        contestDetail.text = text
    }

}
