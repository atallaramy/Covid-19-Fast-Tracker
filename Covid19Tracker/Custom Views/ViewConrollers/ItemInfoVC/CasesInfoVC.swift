//
//  DeathInfoVC.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-14.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class CasesInfoVC:  UIViewController {
    
    
    var headLable          = CovidTitleLable(textAlignment: .center, fontSise: 20)
    var newCasesInfo       = SingleItemInfoVC()
    var activeCasesInfo    = SingleItemInfoVC()
    var criticalCasesInfo  = SingleItemInfoVC()
    var recoveredCasesInfo = SingleItemInfoVC()
    var totalCasesInfo     = SingleItemInfoVC()
    
    var country: Country!
    
    let innerStackView1    = UIStackView()
    let innerStackView2    = UIStackView()
    let outerStackView     = UIStackView()
    
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        self.country       = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHeadLable()
        configureStackViews()
        configureBackgroundView()
        configureLayoutUI()
        configureInfoItems()
    }
    
    private func configureHeadLable() {
        headLable.text = "Cases"
    }
    
    private func configureInfoItems() {
        newCasesInfo.set(itemInfoType: .newCases, withCount: country.cases.new ?? "Not Available")
        activeCasesInfo.set(itemInfoType: .activeCases, withCount: country.cases.active ?? 0000)
        criticalCasesInfo.set(itemInfoType: .creticalCases, withCount: country.cases.critical ?? 0000)
        recoveredCasesInfo.set(itemInfoType: .recoveredCases, withCount: country.cases.recovered ?? 0000)
        totalCasesInfo.set(itemInfoType: .totalCases, withCount: country.cases.total ?? 0000)
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius           = 18
        view.backgroundColor              = .secondarySystemBackground
    }
    
    private func configureStackViews() {
        innerStackView1.axis              = .horizontal
        innerStackView2.axis              = .horizontal
        outerStackView.axis               = .vertical
        
        innerStackView1.distribution      = .equalCentering
        innerStackView2.distribution      = .equalCentering
        outerStackView.distribution       = .fillEqually
    }
    
    func configureLayoutUI() {
        innerStackView1.addArrangedSubview(newCasesInfo)
        innerStackView1.addArrangedSubview(activeCasesInfo)
        innerStackView2.addArrangedSubview(criticalCasesInfo)
        innerStackView2.addArrangedSubview(recoveredCasesInfo)
        outerStackView.addArrangedSubview(innerStackView1)
        outerStackView.addArrangedSubview(innerStackView2)
        
        let itemViews = [headLable, outerStackView, totalCasesInfo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            headLable.topAnchor.constraint(equalTo: view.topAnchor),
            headLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            headLable.heightAnchor.constraint(equalToConstant: 28),
            
            outerStackView.topAnchor.constraint(equalTo: headLable.bottomAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: headLable.leadingAnchor, constant: 25),
            outerStackView.trailingAnchor.constraint(equalTo: headLable.trailingAnchor, constant: -25),
            outerStackView.heightAnchor.constraint(equalToConstant: 120),
            
            totalCasesInfo.topAnchor.constraint(equalTo: outerStackView.bottomAnchor),
            totalCasesInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalCasesInfo.widthAnchor.constraint(equalToConstant: 70),
            totalCasesInfo.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
}
