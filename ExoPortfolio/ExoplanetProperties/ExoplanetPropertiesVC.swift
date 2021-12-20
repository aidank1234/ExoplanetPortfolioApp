//
//  ExoplanetPropertiesVC.swift
//  ExoPortfolio
//
//  Created by Aidan Kaiser on 12/19/21.
//

import UIKit

class ExoplanetPropertiesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var planet: String = "jupiter"
    
    
    @IBOutlet weak var exoplanetPropertiesTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setNavbarToClear()
        setBackButton()
        
        exoplanetPropertiesTableView.delegate = self
        exoplanetPropertiesTableView.dataSource = self
        exoplanetPropertiesTableView.allowsSelection = false
        exoplanetPropertiesTableView.separatorStyle = .none
        exoplanetPropertiesTableView.showsVerticalScrollIndicator = false
        
        exoplanetPropertiesTableView.delegate = self
        exoplanetPropertiesTableView.dataSource = self
        exoplanetPropertiesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Headers
        if indexPath.row == 0 || indexPath.row == 5 {
            return 45
        }
        // Explanation for Given Values
        else if indexPath.row == 1 {
            return 275
        }
        // Single Value Cells
        else if indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 8 {
            return 115
        }
        // Graphs
        else if indexPath.row == 6 {
            return 290
        }
        // Explanation for transit graph
        else if indexPath.row == 7 {
            return 275
        }
        
        
        return 115
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Put given values about our star at the top. These values will remain consistent accross both planets.
        // First row is the 'given values' header
        if indexPath.row == 0 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            cell.headerLabel.text = "Given Values"
            return cell
        }
        // Second row is the explanation for the 'given values' section
        else if indexPath.row == 1 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
            cell.explanatoryView.textTitle.text = "Explanation"
            cell.explanatoryView.explanatoryText.text = "These values relating to the exoplanet's star were given to our research team in lab. We did not calculate these values. Based on these values and their similarity to that of the sun, the star appears to be a main-sequence star."
            return cell
        }
        // Third row is the mass of the star
        else if indexPath.row == 2 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
            cell.singleValueView.contestReviewTitle.text = "Star Mass"
            cell.singleValueView.contestDetail.text = "1.1 Solar Masses"
            return cell
        }
        // Fourth row is the radius of the star
        else if indexPath.row == 3 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
            cell.singleValueView.contestReviewTitle.text = "Star Radius"
            cell.singleValueView.contestDetail.text = "1.82 Solar Radii"
            return cell
        }
        // Fifth row is the temperature of the star
        else if indexPath.row == 4 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
            cell.singleValueView.contestReviewTitle.text = "Star Temperature"
            cell.singleValueView.contestDetail.text = "5600 Kelvin"
            return cell
        }
        
        
        //Exoplanet properties for migrating jupiter
        if planet == "jupiter" {
            // Header for 'Orbital Period'
            if indexPath.row == 5 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Orbital Period"
                return cell
            }
            // Transit Graph
            if indexPath.row == 6 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "transitJupiter")
                cell.graphView.graphTitle.text = "Exoplanet Transit"
                return cell
            }
            // Explanation of transit graph
            else if indexPath.row == 7 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Transit Details"
                cell.explanatoryView.explanatoryText.text = "Our research team noticed that in our light curve data, there was a drop in normalized flux about every 115 days. Using phase folding, we were able to draw out a clear exoplanet transit with a period of 114.75 days."
                return cell
            }
            // Declaration of period value
            else if indexPath.row == 8 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Period"
                cell.singleValueView.contestDetail.text = "114.75 days"
                return cell
            }
        
        }
        
        //Exoplanet properties for super puff
        if planet == "puff" {
            
        }
        
        return UITableViewCell()
    }
}
