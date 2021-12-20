//
//  ExplanatoryTextView.swift
//  ExoPortfolio
//
//  Created by Aidan Kaiser on 12/19/21.
//

import UIKit

class ExplanatoryTextView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var explanatoryText: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "ExplanatoryTextView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = self.bounds
        contentView.layer.cornerRadius = 20.0
        
        addSubview(contentView)
    }

}
