//
//  FavoriteCell.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-19.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseID = "favoriteCell"
    let countryLable = CovidTitleLable(textAlignment: .left, fontSise: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Country) {
        countryLable.text = favorite.country
    }
    
    
    private func configure() {
        addSubviews(countryLable)
        accessoryType        = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            countryLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryLable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countryLable.heightAnchor.constraint(equalToConstant: 60),
            countryLable.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
}
