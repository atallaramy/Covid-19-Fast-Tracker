//
//  CovidError.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import Foundation

enum CovidError: String, Error {
    case unableToComplete   = "Unable to complete your request please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid, please try again"
    case invalidURL         = "The URL used is invalid"
    case alreadyInFavorites = "This country is already in your favorites List"
    case unableToFavorite   = "Can not add this country to favorites, please try again later"
}
