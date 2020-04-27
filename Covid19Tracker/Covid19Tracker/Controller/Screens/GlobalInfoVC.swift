//
//  Setting.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class GlobalInfoVC: UIViewController {
    
    let country = "All"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCovid19DetailsIn(counry: "All")
    }
    
    private func showCovid19DetailsIn(counry: String) {
        let destVC                     = CountryDetailsVC()
        destVC.itemViewThree.isHidden  = true
        destVC.countryName             = counry
        destVC.title                   = "Global"
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem?.tintColor = .clear
        navigationController!.pushViewController(destVC, animated: true)
    }
}
