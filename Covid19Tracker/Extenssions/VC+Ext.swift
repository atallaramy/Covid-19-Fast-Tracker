//
//  VC+Ext.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-14.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

extension DataLoadingVC {
    
    func keyboardDismissTabGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showErrorMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = CovidEmptyStatement(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
}
