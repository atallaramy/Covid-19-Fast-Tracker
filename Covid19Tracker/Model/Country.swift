//
//  Country.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import Foundation

struct Country: Codable, Hashable {
    var country: String
    let cases: Cases
    let deaths: Deaths
    let tests: Tests
}


