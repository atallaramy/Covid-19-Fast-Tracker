//
//  CovidEmptyStatement.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-19.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class CovidEmptyStatement: UIView {
    
    let messageLable = CovidTitleLable(textAlignment: .center, fontSise: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLable.text = message
    }
    
    private func configure() {
        addSubviews(logoImageView,messageLable)
        configureMessageLable()
        configureLogoImageView()
    }
    
    private func configureMessageLable() {
        messageLable.numberOfLines    = 3
        messageLable.textColor        = .secondaryLabel
        
        let messageLableCenterYConstraint: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -110 : -140
        
        NSLayoutConstraint.activate([
            messageLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: messageLableCenterYConstraint),
            messageLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLable.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureLogoImageView() {
        logoImageView.image = Images.emptyStateLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.7),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 270),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
    }
    
}
