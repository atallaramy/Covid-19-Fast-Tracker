//
//  TableViewBackgroundImage.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-13.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class TableViewBackgroundImage: UIImageView {
    
    let placeholderImage = UIImage(named: "TableViewBackgroundImage")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        image                = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
