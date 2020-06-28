//
//  TestInfoVC.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-15.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class TestInfoVC: UIViewController  {
    
    let headLable          = CovidTitleLable(textAlignment: .center, fontSise: 20)
    let testInfo = SingleItemInfoVC()
    
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
        
        headLable.text = "Tests"
        configureBackgroundView()
        configureIntoItems()
        configureLayoutUI()
    }
    
    private func configureIntoItems() {
        testInfo.set(itemInfoType: .totalTests, withCount: country.tests.total ?? 0000)
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius    = 18
        view.backgroundColor       = .secondarySystemBackground
    }
    
    private func configureLayoutUI() {
        view.addSubviews(headLable, testInfo)
        headLable.translatesAutoresizingMaskIntoConstraints = false
        testInfo.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            headLable.topAnchor.constraint(equalTo: view.topAnchor),
            headLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            headLable.heightAnchor.constraint(equalToConstant: 28),
            
            testInfo.topAnchor.constraint(equalTo: headLable.bottomAnchor),
            testInfo.widthAnchor.constraint(equalToConstant: 70),
            testInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testInfo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
