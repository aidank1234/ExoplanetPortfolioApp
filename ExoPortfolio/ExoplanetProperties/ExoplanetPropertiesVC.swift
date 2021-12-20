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
        return 19
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Headers
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15 {
            return 45
        }
        // Explanation for Given Values
        else if indexPath.row == 3 || indexPath.row == 1 || indexPath.row == 17 {
            return 275
        }
        // Single Value Cells
        else if indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 10 || indexPath.row == 14 || indexPath.row == 18 {
            return 115
        }
        // Graphs
        else if indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 13 || indexPath.row == 16 {
            return 290
        }
        // Explanation for transit graph
        else if indexPath.row == 9 {
            return 275
        }
        
        
        return 115
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Put given values about our star at the top. These values will remain consistent accross both planets.
        if indexPath.row == 0 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            cell.headerLabel.text = "Note About Uncertainty"
            return cell
        }
        else if indexPath.row == 1 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
            cell.explanatoryView.textTitle.text = "Uncertainty Range"
            cell.explanatoryView.explanatoryText.text = "No measure that our research team took in lab is perfect. There will always be some level of unpredictable error. To account for this, I will give each measurement as an interval with an error margin of 5% around the computed value."
            return cell
        }
        // First row is the 'given values' header
        if indexPath.row == 2 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            cell.headerLabel.text = "Given Values"
            return cell
        }
        // Second row is the explanation for the 'given values' section
        else if indexPath.row == 3 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
            cell.explanatoryView.textTitle.text = "Explanation"
            cell.explanatoryView.explanatoryText.text = "These values relating to the exoplanet's star were given to our research team in lab. We did not calculate these values. Based on these values and their similarity to that of the sun, the star appears to be a main-sequence star."
            return cell
        }
        // Third row is the mass of the star
        else if indexPath.row == 4 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
            cell.singleValueView.contestReviewTitle.text = "Star Mass"
            cell.singleValueView.contestDetail.text = "1.1 Solar Masses"
            return cell
        }
        // Fourth row is the radius of the star
        else if indexPath.row == 5 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
            cell.singleValueView.contestReviewTitle.text = "Star Radius"
            cell.singleValueView.contestDetail.text = "1.82 Solar Radii"
            return cell
        }
        // Fifth row is the temperature of the star
        else if indexPath.row == 6 {
            let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
            cell.singleValueView.contestReviewTitle.text = "Star Temperature"
            cell.singleValueView.contestDetail.text = "5600 Kelvin"
            return cell
        }
        
        
        //Exoplanet properties for migrating jupiter
        if planet == "jupiter" {
            // Header for 'Orbital Period'
            if indexPath.row == 7 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Orbital Period"
                return cell
            }
            // Transit Graph
            if indexPath.row == 8 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "transitJupiter")
                cell.graphView.graphTitle.text = "Exoplanet Transit"
                return cell
            }
            // Explanation of transit graph
            else if indexPath.row == 9 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Transit Details"
                cell.explanatoryView.explanatoryText.text = "Our research team noticed that in our light curve data, there was a drop in normalized flux about every 115 days. Using phase folding, we were able to draw out a clear exoplanet transit with a period of 114.75 days."
                return cell
            }
            // Declaration of period value
            else if indexPath.row == 10 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Period"
                cell.singleValueView.contestDetail.text = "109.0 - 120.5 days"
                return cell
            }
            // Header for 'Semimajor Axis'
            if indexPath.row == 11 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Semimajor Axis"
                return cell
            }
            // Semimajor axis formula
            if indexPath.row == 12 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "semimajorComputation")
                cell.graphView.graphTitle.text = "Period & Semimajor Axis"
                return cell
            }
            // Semimajor axis formula
            if indexPath.row == 13 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "jupiterSemimajorComputation")
                cell.graphView.graphTitle.text = "Calculation"
                return cell
            }
            // Declaration of semimajor axis
            else if indexPath.row == 14 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Semimajor Axis"
                cell.singleValueView.contestDetail.text = "0.38 - 0.57 AU"
                return cell
            }
            // Header for 'Radial Velocity'
            if indexPath.row == 15 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Radial Velocity"
                return cell
            }
            // Radial Velocity Graph
            if indexPath.row == 16 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "radialVelocityJupiter")
                cell.graphView.graphTitle.text = "Radial Velocity Curve"
                return cell
            }
            // Explanation of transit graph
            else if indexPath.row == 17 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Radial Velocity Details"
                cell.explanatoryView.explanatoryText.text = "Our research team noticed that a radial velocity sine curve emerged after phase folding for the exoplanet's period. The maxima of this curve represent the total velocity of the star due to the planet's gravitational tug."
                return cell
            }
            // Declaration of radial velocity value
            else if indexPath.row == 18 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Radial Velocity"
                cell.singleValueView.contestDetail.text = "38 - 42 m/s"
                return cell
            }
        }
        
        //Exoplanet properties for super puff
        if planet == "puff" {
            
        }
        
        return UITableViewCell()
    }
}
