//
//  TotalCovidVCViewController.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit
import CoreLocation

class CovidLocalInfoVC: DataLoadingVC {
    
    var country: String!
    
    let locationManager = CLLocationManager()
    let geoDecoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoadingView()
        configureLocationManager()
    }
    
    private func configureLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    
    private func showCovid19DetailsIn(counry: String) {
        let destVC                     = CountryDetailsVC()
        destVC.countryName             = counry
        destVC.title                   = counry
        navigationItem.hidesBackButton = true
        navigationController!.pushViewController(destVC, animated: true)
    }
    
}

//MARK: -  CLLocationDelegate

extension CovidLocalInfoVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        dismissLoadingView()
        if let location = locations.last {
            geoDecoder.reverseGeocodeLocation(location) { [weak self] (placeMark, error) in
                guard let self = self else { return }
                if let _ = error {
            
                }
                guard let placeMark = placeMark else { return }
                let place = placeMark[0]
                self.showCovid19DetailsIn(counry: place.country!)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showlLocationErrorAlert()
    }
    
    func showlLocationErrorAlert() {
        let ac = UIAlertController (title: "GPS failed", message: "Check you location settings and app permissions?", preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in

           guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }

            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { [weak self] (void) in
            guard let self = self else { return }
            self.dismissLoadingView()
        }
            ac.addAction(settingsAction)
            ac.addAction(cancelAction)
            present(ac, animated: true, completion: nil)
        }

}





