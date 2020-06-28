//
//  CasesInfoVC.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-14.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class DeathsInfoVC: UIViewController {
    
    let headLable          = CovidTitleLable(textAlignment: .center, fontSise: 20)
    let newDeathsInfo      = SingleItemInfoVC()
    let totalDeathsInfo    = SingleItemInfoVC()
    let stackView          = UIStackView()
    
    var country: Country!
    
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headLable.text = "Deaths"
        configureStackView()
        configureBackgroundView()
        configureLayoutUI()
        configureInfoItems()
    }
    
    private func configureInfoItems() {
        newDeathsInfo.set(itemInfoType: .newDeaths, withCount: country.deaths.new ?? "Not Available")
        totalDeathsInfo.set(itemInfoType: .totalDeaths, withCount: country.deaths.total ?? 0000)
    }
    
    private func configureStackView() {
        stackView.axis          = .horizontal
        stackView.distribution  = .equalCentering
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    private func configureLayoutUI() {
        stackView.addArrangedSubview(newDeathsInfo)
        stackView.addArrangedSubview(totalDeathsInfo)
        view.addSubviews(headLable, stackView)
        headLable.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            headLable.topAnchor.constraint(equalTo: view.topAnchor),
            headLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            headLable.heightAnchor.constraint(equalToConstant: 28),
            
            stackView.topAnchor.constraint(equalTo: headLable.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: headLable.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: headLable.trailingAnchor, constant: -25),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
  
}
