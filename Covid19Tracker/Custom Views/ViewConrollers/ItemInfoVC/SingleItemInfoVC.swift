//
//  SingleItemInfoVC.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-15.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class SingleItemInfoVC: UIView {
    
    enum ItemInfoType {
        case newCases, activeCases, creticalCases, recoveredCases, totalCases, newDeaths, totalDeaths, totalTests
    }
    
    let symbolImageView = UIImageView()
    let titleLable      = CovidTitleLable(textAlignment: .left, fontSise: 14)
    let countLable      = CovidTitleLable(textAlignment: .center, fontSise: 14)
    let stackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func confiureStackView() {
        stackView.addArrangedSubview(symbolImageView)
        stackView.addArrangedSubview(titleLable)
        stackView.alignment    = .leading
        stackView.distribution = .fill
        stackView.axis         = .horizontal
    }
    
    private func configure() {
        addSubviews(symbolImageView,titleLable,countLable)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode   = .scaleAspectFill
        symbolImageView.tintColor     = .label
        
        NSLayoutConstraint.activate([
            
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLable.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLable.heightAnchor.constraint(equalToConstant: 18),
            
            countLable.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor),
            countLable.leadingAnchor.constraint(equalTo: symbolImageView.leadingAnchor, constant: 5),
            countLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLable.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set<T: LosslessStringConvertible>(itemInfoType: ItemInfoType, withCount count: T) {
        switch itemInfoType {
            
        case .activeCases:
            symbolImageView.image       = SFSymbols.activeCases
            titleLable.text             = "Active   "
        case .creticalCases:
            symbolImageView.image       = SFSymbols.criticalCases
            titleLable.text             = "Critical"
        case .recoveredCases:
            symbolImageView.image       = SFSymbols.recoveredCases
            titleLable.text             = "Recovered"
        case .totalCases:
            symbolImageView.image       = SFSymbols.totalCases
            titleLable.text             = "Total"
        case .totalDeaths:
            symbolImageView.image       = SFSymbols.totalDeaths
            titleLable.text             = "Total"
        case .totalTests:
            symbolImageView.image       = SFSymbols.totalTests
            titleLable.text             = "Total"
        case  .newCases:
            symbolImageView.image       = SFSymbols.newCases
            titleLable.text             = "New"
        case .newDeaths:
            symbolImageView.image       = SFSymbols.newDeaths
            titleLable.text             = "New"
        }
        countLable.text = String(count)
    }
}
