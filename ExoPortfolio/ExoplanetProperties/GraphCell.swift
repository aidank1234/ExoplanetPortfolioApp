//
//  GraphCell.swift
//  ExoPortfolio
//
//  Created by Aidan Kaiser on 12/19/21.
//

import UIKit

class GraphCell: UITableViewCell {
    @IBOutlet weak var graphView: GraphViewWithTitle!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
