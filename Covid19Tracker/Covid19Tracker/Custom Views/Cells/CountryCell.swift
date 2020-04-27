//
//  CountryCellTableViewCell.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-13.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class CountryCell: UICollectionViewCell {
    
    static let reuseID = "CountryCell"
    let backgroundImage = TableViewBackgroundImage(frame: .zero)
    let countryLable = CovidTitleLable(textAlignment: .left, fontSise: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: Country) {
        countryLable.text = country.country
    }
    
    func configure() {
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = .quaternaryLabel
        addSubview(backgroundImage)
        addSubview(countryLable)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.widthAnchor.constraint(equalToConstant: 90),
            backgroundImage.heightAnchor.constraint(equalToConstant: 50),
            
            countryLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            countryLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryLable.trailingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 8),
            countryLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
