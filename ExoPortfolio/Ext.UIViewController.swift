//
//  Ext.UIViewController.swift
//  PicksApp
//
//  Created by Aidan Kaiser on 1/7/21.
//  Copyright © 2021 Aidan Kaiser. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavbarToClear() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func setBackButton() {
        let item = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(popViewController))
        item.tintColor = UIColor.AppColors.clouds
        item.imageInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        item.width = 44
        
        self.navigationItem.leftBarButtonItem = item
    }
}
