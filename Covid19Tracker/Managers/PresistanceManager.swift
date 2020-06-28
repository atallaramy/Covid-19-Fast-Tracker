//
//  PresistanceManager.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-19.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import Foundation

enum PresistanceActionType {
    case add, remove
}

enum PresistanceManager {
    static private let defaults = UserDefaults.standard
    enum Keys { static let favorites = "favorites" }
    
    static func updateWith(favorite: Country, actionType: PresistanceActionType, completed: @escaping(CovidError?) -> Void) {
        retrieveFavorites { (result) in
            switch result {
            case .success(var retrievedFavorites):
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.country == favorite.country }
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Country], CovidError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Country].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Country]) -> CovidError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
