//
//  Cases.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import Foundation

struct Cases: Codable, Hashable {
    var new: String?
    var active: Int?
    var critical: Int?
    var recovered: Int?
    var total: Int?
}
