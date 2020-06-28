//
//  CovidByCountruVC.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class CovidByCountryVC: DataLoadingVC {
    
    
    enum Section {
        case main
    }
    
    var countries: [Country] = []
    var filterdedCountries: [Country] = []
    var coutryName: String!
    var isSearching = false
    
    var searchController = UISearchController()
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Country>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confugureView()
        configureCollectionView()
        configureDataSource()
        configureSearchController()
        
    }
    
    private func confugureView() {
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        creatCovidDetails()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: creatFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CountryCell.self, forCellWithReuseIdentifier: Cells.countryCell)
    }
    
    func creatCovidDetails() {
        showLoadingView()
        NetworkManager.shared.getCovidInfo() { [weak self] (result) in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let countries):
                self.countries = countries
                self.updateData(on: countries)
                
            case .failure(let error):
                self.showErrorMessage(title: "Fail loading", message: error.rawValue)
            }
        }
    }
    
    func creatFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width - 16
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        flowLayout.itemSize = CGSize(width: width, height: 50)
        return flowLayout
    }
    
    func addButtonTapped(for country: String) {
        showLoadingView()
        NetworkManager.shared.getCountryCovidInfo(for: country) { [weak self] result in
            guard let self = self else {return}
            self.dismissLoadingView()
            
            switch result {
            case .success(let countries):
                self.addCountryToFavorit(country: countries.first!)
                print("Add button tapped")
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showErrorMessage(title: "Something went wrong", message: error.rawValue)
                }
            }
        }
    }
    
    
    func addCountryToFavorit(country: Country) {
//        let country = country
//        previous line is to check if it is woking, if not delete later
        PresistanceManager.updateWith(favorite: country, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                DispatchQueue.main.async {
                    self.searchController.searchBar.text?.removeAll()
                    self.showErrorMessage(title: "Success", message: "This country successefuly added to your favorites")
                }
                return
            }
            DispatchQueue.main.async {
                self.showErrorMessage(title: "Something went wrong", message: error.rawValue)
            }
        }
    }
    
}

//MARK: - UICollectionViewDelegation
extension CovidByCountryVC: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filterdedCountries : countries
        let country     = activeArray[indexPath.item]
        
        let destVC      = CountryDetailVCWithNavigationButtons()
        destVC.countryName  = country.country
        destVC.title    = country.country
        let destNC      = UINavigationController(rootViewController: destVC)
        present(destNC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil){ action in
            let viewMenu = UIAction(title: "Add to favorites", image: UIImage(systemName: "plus"), identifier: UIAction.Identifier(rawValue: "Favorites")) {_ in
                let activeArray = self.isSearching ? self.filterdedCountries : self.countries
                let country     = activeArray[indexPath.item]
                self.addButtonTapped(for: country.country)
                
            }
            
            return UIMenu(title: "Favorites", image: nil, identifier: nil, children: [viewMenu])
        }
        
        return configuration
    }
    
    func updateData(on countries: [Country]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections([.main])
        snapshot.appendItems(countries)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Country>(collectionView: collectionView, cellProvider: { (collectioView, indexPath, country) -> UICollectionViewCell? in
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Cells.countryCell, for: indexPath) as! CountryCell
            cell.set(country: country)
            return cell
        })
    }
    
}


//MARK: - SearchResultUpdating

extension CovidByCountryVC: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter =  searchController.searchBar.text, !filter.isEmpty else {
            filterdedCountries.removeAll()
            updateData(on: countries)
            isSearching = false
            return
        }
        isSearching = true
        filterdedCountries = countries.filter{ $0.country.lowercased().contains(filter.lowercased())}
        updateData(on: filterdedCountries)
        return
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(on: countries)
    }
    
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type country"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
    }
    
}

    



