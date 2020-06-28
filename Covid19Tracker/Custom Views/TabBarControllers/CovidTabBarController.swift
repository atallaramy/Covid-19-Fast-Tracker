//
//  CovidTabBarController.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class CovidTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [creatCovidByCountryVC(), createLocalCovidVC(), creatGlobalVC(), createInformationVC()]
    }
    
    func createLocalCovidVC() -> UINavigationController {
        let covidTotalVC = CovidLocalInfoVC()
        covidTotalVC.title = "Local"
        covidTotalVC.tabBarItem = UITabBarItem(title: "Local", image: UIImage(systemName: "pin.fill"), tag: 0)
        let covidTotalNC = UINavigationController(rootViewController: covidTotalVC)
        return covidTotalNC
    }
    
    func creatCovidByCountryVC() -> UINavigationController {
        let covidByCountryVC = CovidByCountryVC()
        covidByCountryVC.title = "Countries"
        covidByCountryVC.tabBarItem = UITabBarItem(title: "Countries", image: UIImage(systemName: "flag.fill"), tag: 1)
        let covidByCOuntryNC = UINavigationController(rootViewController: covidByCountryVC)
        return covidByCOuntryNC
    }
    
    func createInformationVC() -> UINavigationController {
        let informationVC = FavoritesListVC()
        informationVC.title = "Favorites"
        informationVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 2)
        let informationNC = UINavigationController(rootViewController: informationVC)
        return informationNC
    }
    
    func creatGlobalVC() -> UINavigationController {
        let settingVC = GlobalInfoVC()
        settingVC.title = "Global"
        settingVC.tabBarItem = UITabBarItem(title: "Global", image: UIImage(systemName: "globe"), tag: 3)
        let settingNC = UINavigationController(rootViewController: settingVC)
        return settingNC
    }
    
}


