//
//  CountryDetailsVCViewController.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-14.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

protocol CountryDetailDelegate: class {
    func addButtonTapped(for country: String)
}

class CountryDetailsVC: DataLoadingVC {
    
    let scrollView      = UIScrollView()
    let contentView     = UIView()
    let headLable       = CovidTitleLable(textAlignment: .center, fontSise: 24)
    let itemViewOne     = UIView()
    let itemViewTwo     = UIView()
    let itemViewThree   = UIView()
    let dateLable       = CovidTitleLable(textAlignment: .center, fontSise: 10)
    var itemViews: [UIView] = []
    
    var countryName: String!
    weak var delegate: CountryDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        configureScrollView()
        getCovidDetailsFor(country: countryName)
        configureLayoutUI()
    }
    func getCovidDetailsFor(country: String) {
        NetworkManager.shared.getCountryCovidInfo(for: country) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let country):
                DispatchQueue.main.async {
                    self.configureUIElements(with: country[0])
                }
            case .failure(let error):
                self.showErrorMessage(title: "Fail loading Data", message: error.rawValue)
            }
        }
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesBackButton = true
        
    }
    
    func configureUIElements(with country: Country) {
        self.addChildView(childVC: CasesInfoVC(country: country), to: self.itemViewOne)
        self.addChildView(childVC: DeathsInfoVC(country: country), to: self.itemViewTwo)
        self.addChildView(childVC: TestInfoVC(country: country), to: self.itemViewThree)
        self.dateLable.text = "Info date and time (user.createdAt.convertToMonthYearFormat())"
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func addChildView(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func configureLayoutUI() {
        itemViews = [itemViewOne, itemViewTwo, itemViewThree]
        view.addSubviews(itemViewTwo, itemViewTwo, itemViewThree)
        let padding: CGFloat = 8
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            
            itemViewOne.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15),
            itemViewOne.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 90),
            
            itemViewThree.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            itemViewThree.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
}

