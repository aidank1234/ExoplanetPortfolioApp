//
//  ExoplanetStoryVC.swift
//  ExoPortfolio
//
//  Created by Aidan Kaiser on 12/20/21.
//

import UIKit

class ExoplanetStoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var exoplanetStoryTableView: UITableView!
    var planet: String = "jupiter"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setNavbarToClear()
        setBackButton()
        
        exoplanetStoryTableView.delegate = self
        exoplanetStoryTableView.dataSource = self
        exoplanetStoryTableView.allowsSelection = false
        exoplanetStoryTableView.separatorStyle = .none
        exoplanetStoryTableView.showsVerticalScrollIndicator = false
        
        exoplanetStoryTableView.delegate = self
        exoplanetStoryTableView.dataSource = self
        exoplanetStoryTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if planet == "jupiter" {
            //Composition
            if indexPath.row == 0 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Composition"
                cell.explanatoryView.explanatoryText.text = "This exoplanet is very similar to Jupiter in terms of composition. It likely has a solid core of rock and ice, just like Jupiter. However, it has a much thicker layer of both liquid and gaseous hydrogen than Jupiter. This leads to the exoplanet having roughly the same mass as Jupiter, but 1.8 times the radius."
                return cell
            }
            //Surface
            else if indexPath.row == 1 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Surface"
                cell.explanatoryView.explanatoryText.text = "If researchers were somehow able to send a probe all the way through the extremely thick atmosphere hydrogen of this exoplanet, they would find a surface composed of a liquid hydrogen ocean and possible metallic hydrogen land masses."
                return cell
            }
            //Origin Story
            else if indexPath.row == 2 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Origin Story"
                cell.explanatoryView.explanatoryText.text = "Much like other Jovian planets, this jupiter originally formed outside of the frost line of its star. Outside of the frost line, it was able to gather enough mass to pull in enough gas to make it what it is today. However, this exoplanet has migrated inside of the frost line due to gravitational events. One day, migration will bring this planet so close to its star that it will become a hot Jupiter."
                return cell            }
            //Habitability
            else if indexPath.row == 3 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Habitability"
                cell.explanatoryView.explanatoryText.text = "With an equilibrium temperature of about 433 Kelvin, liquid water could not exist on this planet. It is not in the habitable zone of its star. Additionally, this planet does not posses an atmosphere similar to that of Earth. Life as we know it could not survive on this hot, Jupiter-like planet."
                return cell
            }
        } else if planet == "puff" {
            //Composition
            if indexPath.row == 0 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Composition"
                cell.explanatoryView.explanatoryText.text = "With an extremely low mean density of around 0.1 grams per centimeters cubed, this exoplanet has to be made almost entirely of gases. These gases could include, but are not limited to, hydrogen, helium, methane, and other hydrogen based compounds. This planet has no rocky or metallic core, and is essentially one big puffball."
                return cell
            }
            //Surface
            else if indexPath.row == 1 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Surface"
                cell.explanatoryView.explanatoryText.text = "This planet does not have a solid surface that we normally think of in terms of an exoplanet's surface. The superpuff is made entirely of gases. I like to think that if we were able to send a probe through the planet, it would go straight through the planet and come out on the other side."
                return cell
            }
            //Origin Story
            else if indexPath.row == 2 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Origin Story"
                cell.explanatoryView.explanatoryText.text = "Nobody knows for sure how superpuff planets form. My best guess is that the exoplanet first formed similarly to any normal Jovian planet. Then, somehow, the core of the Jovian planet eroded as it migrated inside of the frost line, leaving only a gaseous ball. Could a core held together by ice have melted as this planet moved inside of the frost line?"
                return cell
            }
            //Habitability
            else if indexPath.row == 3 {
                let cell = exoplanetStoryTableView.dequeueReusableCell(withIdentifier: "explanatoryCell", for: indexPath) as! ExplanatoryCell
                cell.explanatoryView.textTitle.text = "Habitability"
                cell.explanatoryView.explanatoryText.text = "This planet is barely too hot to have liquid water. The planet is just outside of the habilitability zone of its star. Additionally, this planet does not have any solid surface for life to reside. Life as we know it could not live on this planet."
                return cell
            }
        }
        
        return UITableViewCell()
    }
    


}
