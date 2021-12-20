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
        if planet == "jupiter" {
            if let destController = self.storyboard?.instantiateViewController(withIdentifier: "exoplanetStory") as? ExoplanetStoryVC {
                destController.modalPresentationStyle = .overFullScreen
                destController.planet = "jupiter"
                self.navigationController?.pushViewController(destController, animated: true)
            }
        } else {
            if let destController = self.storyboard?.instantiateViewController(withIdentifier: "exoplanetStory") as? ExoplanetStoryVC {
                destController.modalPresentationStyle = .overFullScreen
                destController.planet = "puff"
                self.navigationController?.pushViewController(destController, animated: true)
            }
        }
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
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Headers
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 15 || indexPath.row == 19 || indexPath.row == 23 || indexPath.row == 26 || indexPath.row == 29 || indexPath.row == 33 || indexPath.row == 36 {
            return 45
        }
        // Explanation for Given Values
        else if indexPath.row == 3 || indexPath.row == 1 || indexPath.row == 17 || indexPath.row == 24 || indexPath.row == 27 || indexPath.row == 34 {
            return 275
        }
        // Single Value Cells
        else if indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 10 || indexPath.row == 14 || indexPath.row == 18 || indexPath.row == 22 || indexPath.row == 25 || indexPath.row == 28 || indexPath.row == 32 || indexPath.row == 35 || indexPath.row == 39 {
            return 115
        }
        // Graphs
        else if indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 13 || indexPath.row == 16 || indexPath.row == 20 || indexPath.row == 21 || indexPath.row == 30 || indexPath.row == 31 || indexPath.row == 37 || indexPath.row == 38 {
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
            // Explanation of radial velocity graph
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
            // Header for 'Exoplanet Mass'
            else if indexPath.row == 19 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Exoplanet Mass"
                return cell
            }
            // Graph image for exoplanet mass formula
            else if indexPath.row == 20 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "planetMassComputation")
                cell.graphView.graphTitle.text = "Exoplanet Mass Formula"
                return cell
            }
            else if indexPath.row == 21 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "jupiterMassComputation")
                cell.graphView.graphTitle.text = "Exoplanet Mass Computation"
                return cell
            }
            else if indexPath.row == 22 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Mass"
                cell.singleValueView.contestDetail.text = "0.96 - 1.07 Jupiter Masses"
                return cell
            }
            // Header for 'Exoplanet Radius'
            else if indexPath.row == 23 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Exoplanet Radius"
                return cell
            }
            // Explanation of exoplanet radius
            else if indexPath.row == 24 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Exoplanet Radius Details"
                cell.explanatoryView.explanatoryText.text = "Our research team used the NAAP transit simulator, information about our star, and previously calculated attributes of the exoplanet in order to calculate the exoplanet's radius."
                return cell
            }
            else if indexPath.row == 25 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Radius"
                cell.singleValueView.contestDetail.text = "1.10 - 1.22 Jupiter Radii"
                return cell
            }
            // Header for 'Exoplanet Albedo'
            else if indexPath.row == 26 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Exoplanet Albedo"
                return cell
            }
            // Explanation of exoplanet albedo
            else if indexPath.row == 27 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Exoplanet Albedo Details"
                cell.explanatoryView.explanatoryText.text = "Our research team noticed that the exoplanet's mean density is right near the midpoint of Jupiter & Saturn's mean densities. Given that both Jupiter & Saturn have an albedo around 0.5, that is what we estimated for this exoplanet's albedo."
                return cell
            }
            else if indexPath.row == 28 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Albedo Estimation"
                cell.singleValueView.contestDetail.text = "0.5"
                return cell
            }
            // Header for 'Equilibrium Temperature'
            else if indexPath.row == 29 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Equilibrium Temperature"
                return cell
            }
            // Graph image for temperature formula
            else if indexPath.row == 30 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "temperatureComputation")
                cell.graphView.graphTitle.text = "Formula"
                return cell
            }
            else if indexPath.row == 31 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "jupiterTemperatureComputation")
                cell.graphView.graphTitle.text = "Computation"
                return cell
            }
            else if indexPath.row == 32 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Equilibrium Temperature"
                cell.singleValueView.contestDetail.text = "421 - 465 Kelvin"
                return cell
            }
            // Header for 'Eccentricity'
            else if indexPath.row == 33 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Orbital Eccentricity"
                return cell
            }
            // Explanation of eccentricity
            else if indexPath.row == 34 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Orbital Eccentricity"
                cell.explanatoryView.explanatoryText.text = "We compared our radial velocity curves to that of the NAAP orbital eccentricity simulator. The eccentricity of the exoplanet appears to be very circular. Since we cannot measure eccentricity, we will estimate it to be about 0.03."
                return cell
            }
            else if indexPath.row == 35 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Orbital Eccentricity"
                cell.singleValueView.contestDetail.text = "0.029 - 0.032"
                return cell
            }
            // Header for 'Mean Density
            else if indexPath.row == 36 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Mean Density"
                return cell
            }
            // Graph image for mean density formula
            else if indexPath.row == 37 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "meanDensityComputation")
                cell.graphView.graphTitle.text = "Formula"
                return cell
            }
            else if indexPath.row == 38 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "jupiterDensityComputation")
                cell.graphView.graphTitle.text = "Computation"
                return cell
            }
            else if indexPath.row == 39 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Mean Density"
                cell.singleValueView.contestDetail.text = "0.83 - 0.91 g/cm^3"
                return cell
            }
        }
        
        //Exoplanet properties for super puff
        if planet == "puff" {
            // Header for 'Orbital Period'
            if indexPath.row == 7 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Orbital Period"
                return cell
            }
            // Transit Graph
            if indexPath.row == 8 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "transitPuff")
                cell.graphView.graphTitle.text = "Exoplanet Transit"
                return cell
            }
            // Explanation of transit graph
            else if indexPath.row == 9 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Transit Details"
                cell.explanatoryView.explanatoryText.text = "Our research team noticed that in our light curve data, there was a drop in normalized flux about every 192 days. Using phase folding, we were able to draw out a clear exoplanet transit with a period of 192.25 days."
                return cell
            }
            // Declaration of period value
            else if indexPath.row == 10 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Period"
                cell.singleValueView.contestDetail.text = "182.6 - 201.9 days"
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
                cell.graphView.graphImage.image = UIImage(named: "superpuffSemimajorComputation")
                cell.graphView.graphTitle.text = "Calculation"
                return cell
            }
            // Declaration of semimajor axis
            else if indexPath.row == 14 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Semimajor Axis"
                cell.singleValueView.contestDetail.text = "0.62 - 0.68 AU"
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
                cell.graphView.graphImage.image = UIImage(named: "radialVelocityPuff")
                cell.graphView.graphTitle.text = "Radial Velocity Curve"
                return cell
            }
            // Explanation of radial velocity graph
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
                cell.singleValueView.contestDetail.text = "0.67 - 0.74 m/s"
                return cell
            }
            // Header for 'Exoplanet Mass'
            else if indexPath.row == 19 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Exoplanet Mass"
                return cell
            }
            // Graph image for exoplanet mass formula
            else if indexPath.row == 20 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "planetMassComputation")
                cell.graphView.graphTitle.text = "Exoplanet Mass Formula"
                return cell
            }
            else if indexPath.row == 21 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "superpuffMassComputation")
                cell.graphView.graphTitle.text = "Exoplanet Mass Computation"
                return cell
            }
            else if indexPath.row == 22 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Mass"
                cell.singleValueView.contestDetail.text = "0.022 - 0.024 Jupiter Masses"
                return cell
            }
            // Header for 'Exoplanet Radius'
            else if indexPath.row == 23 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Exoplanet Radius"
                return cell
            }
            // Explanation of exoplanet radius
            else if indexPath.row == 24 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Exoplanet Radius Details"
                cell.explanatoryView.explanatoryText.text = "Our research team used the NAAP transit simulator, information about our star, and previously calculated attributes of the exoplanet in order to calculate the exoplanet's radius."
                return cell
            }
            else if indexPath.row == 25 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Exoplanet Radius"
                cell.singleValueView.contestDetail.text = "0.53 - 0.59 Jupiter Radii"
                return cell
            }
            // Header for 'Exoplanet Albedo'
            else if indexPath.row == 26 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Exoplanet Albedo"
                return cell
            }
            // Explanation of exoplanet albedo
            else if indexPath.row == 27 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Exoplanet Albedo Details"
                cell.explanatoryView.explanatoryText.text = "Our research team noticed that the mean density of this exoplanet is going to end up being extremely low. This must mean that the planet is composed mostly of gas, like the jovian planets. For this reason, our research team estimated an albedo of 0.5."
                return cell
            }
            else if indexPath.row == 28 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Albedo Estimation"
                cell.singleValueView.contestDetail.text = "0.5"
                return cell
            }
            // Header for 'Equilibrium Temperature'
            else if indexPath.row == 29 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Equilibrium Temperature"
                return cell
            }
            // Graph image for temperature formula
            else if indexPath.row == 30 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "temperatureComputation")
                cell.graphView.graphTitle.text = "Formula"
                return cell
            }
            else if indexPath.row == 31 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "superpuffTemperatureComputation")
                cell.graphView.graphTitle.text = "Computation"
                return cell
            }
            else if indexPath.row == 32 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Equilibrium Temperature"
                cell.singleValueView.contestDetail.text = "361 - 399 Kelvin"
                return cell
            }
            // Header for 'Eccentricity'
            else if indexPath.row == 33 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Orbital Eccentricity"
                return cell
            }
            // Explanation of eccentricity
            else if indexPath.row == 34 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Orbital Eccentricity"
                cell.explanatoryView.explanatoryText.text = "We compared our radial velocity curves to that of the NAAP orbital eccentricity simulator. The eccentricity of the exoplanet appears to be very circular. Since we cannot measure eccentricity, we will estimate it to be about 0.03."
                return cell
            }
            else if indexPath.row == 35 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Orbital Eccentricity"
                cell.singleValueView.contestDetail.text = "0.029 - 0.032"
                return cell
            }
            // Header for 'Mean Density
            else if indexPath.row == 36 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
                cell.headerLabel.text = "Mean Density"
                return cell
            }
            // Graph image for mean density formula
            else if indexPath.row == 37 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "meanDensityComputation")
                cell.graphView.graphTitle.text = "Formula"
                return cell
            }
            else if indexPath.row == 38 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
                cell.graphView.graphImage.image = UIImage(named: "superpuffDensityComputation")
                cell.graphView.graphTitle.text = "Computation"
                return cell
            }
            else if indexPath.row == 39 {
                let cell = exoplanetPropertiesTableView.dequeueReusableCell(withIdentifier: "singleValueCell", for: indexPath) as! SingleValueCell
                cell.singleValueView.contestReviewTitle.text = "Mean Density"
                cell.singleValueView.contestDetail.text = "0.14 - 0.16 g/cm^3"
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
