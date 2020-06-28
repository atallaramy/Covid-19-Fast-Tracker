//
//  CountryDetailVCWithNavigationButtons.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-22.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

class CountryDetailVCWithNavigationButtons: CountryDetailsVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        createNavigationButtons()
    }
    
    func createNavigationButtons() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }


}
