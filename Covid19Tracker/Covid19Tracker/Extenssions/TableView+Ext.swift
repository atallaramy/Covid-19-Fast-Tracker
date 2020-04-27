//
//  TableView+Ext.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-19.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UITableView(frame: .zero)
    }
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
}
